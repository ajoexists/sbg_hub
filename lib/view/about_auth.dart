import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import 'package:login_screen/viewmodel/about_auth_view_model.dart';
import 'package:login_screen/model/pre_def_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class AboutAuthPage extends StatefulWidget {
  final Function(bool?) onResult;
  const AboutAuthPage({super.key, required this.onResult});

  @override
  AboutAuthPageState createState() => AboutAuthPageState();
}

class AboutAuthPageState extends State<AboutAuthPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserModel predefinedData = UserModel(
      preDefUsername: 'admin',
      preDefPassword: '123'
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<AuthPageModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.grey.shade900,
                Colors.grey.shade800,
              ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: ResponsiveBreakpoints.of(context).screenHeight * 0.2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Authentication',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: ResponsiveBreakpoints.of(context).screenHeight * 0.05,),
                    Center(
                      child: Container(
                        width: ResponsiveBreakpoints.of(context).isMobile
                            ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
                            : ResponsiveBreakpoints.of(context).screenWidth * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade300,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value != 'admin') {
                                    return 'Invalid username';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                        color: Colors.grey
                                    )
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: viewModel.loginIsObscure,
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value != '123') {
                                    return 'Invalid password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(viewModel.loginIsObscure ? Icons.visibility_off : Icons.visibility),
                                      onPressed: () {
                                        viewModel.toggleLoginPasswordVisibility();
                                      }
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveBreakpoints.of(context).screenHeight * 0.05,),
                    SizedBox(
                      width: ResponsiveBreakpoints.of(context).isDesktop ? 250 : 240,
                      height: ResponsiveBreakpoints.of(context).isDesktop ? 60 : 50,
                      child: ElevatedButton(
                        onPressed: () {
                          String username = usernameController.text;
                          String password = passwordController.text;
                          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                            if (username == predefinedData.preDefUsername && password == predefinedData.preDefPassword) {
                              widget.onResult.call(true);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            padding: const EdgeInsets.symmetric(vertical: 15)
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 18 : 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

