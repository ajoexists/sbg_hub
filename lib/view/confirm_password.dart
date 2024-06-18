import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import 'package:login_screen/viewmodel/confirm_pass_view_model.dart';
import 'package:responsive_framework/responsive_framework.dart';


@RoutePage()
class ConfirmPasswordPage extends StatefulWidget {
  const ConfirmPasswordPage({super.key});

  @override
  ConfirmPasswordPageState createState() => ConfirmPasswordPageState();
}

class ConfirmPasswordPageState extends State<ConfirmPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConfirmPassViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
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
            SizedBox(height: ResponsiveBreakpoints.of(context).screenHeight * 0.25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Set a New Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveBreakpoints.of(context).isMobile ? 26 : 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Center(
                      child: Container(
                        width: ResponsiveBreakpoints.of(context).isMobile
                            ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
                            : ResponsiveBreakpoints.of(context).screenWidth * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
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
                                obscureText: viewModel.registerIsObscure,
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value.length < 8) {
                                    return 'Minimum 8 characters required';
                                  }
                                  if (!value.contains(RegExp(r'[A-Z]'))) {
                                    return 'Must have uppercase, lowercase, number and special character.';
                                  }
                                  if (!value.contains(RegExp(r'[a-z]'))) {
                                    return 'Must have uppercase, lowercase, number and special character.';
                                  }
                                  if (!value.contains(RegExp(r'[0-9]'))) {
                                    return 'Must have uppercase, lowercase, number and special character.';
                                  }
                                  if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                                    return 'Must have uppercase, lowercase, number and special character.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(viewModel.registerIsObscure ? Icons.visibility_off : Icons.visibility),
                                      onPressed: () {
                                        viewModel.toggleRegisterPasswordVisibility();
                                      }
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'New Password',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: viewModel.confirmIsObscure,
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(viewModel.confirmIsObscure ? Icons.visibility_off : Icons.visibility),
                                      onPressed: () {
                                        viewModel.toggleConfirmPasswordVisibility();
                                      }
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Confirm Password',
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
                    const SizedBox(height: 60,),
                    SizedBox(
                      width: ResponsiveBreakpoints.of(context).isDesktop ? 250 : 240,
                      height: ResponsiveBreakpoints.of(context).isDesktop ? 60 : 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                            viewModel.confirmPasswordAlert(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15)
                        ),
                        child: Center(
                          child: Text(
                            'Next',
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

