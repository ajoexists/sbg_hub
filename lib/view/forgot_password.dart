import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:form_validator/form_validator.dart';
import 'package:login_screen/service/router/app_router.dart';

import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

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
            SizedBox(height: ResponsiveBreakpoints.of(context).screenHeight * 0.3,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Forgot Password',
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
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                controller: emailController,
                                validator: ValidationBuilder()
                                    .email('Enter a valid email')
                                    .build(),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        color: Colors.grey
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveBreakpoints.of(context).screenHeight * 0.08,),
                    SizedBox(
                      width: ResponsiveBreakpoints.of(context).isDesktop ? 250 : 240,
                      height: ResponsiveBreakpoints.of(context).isDesktop ? 60 : 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                            AutoRouter.of(context).push(const ConfirmPasswordRoute());
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

