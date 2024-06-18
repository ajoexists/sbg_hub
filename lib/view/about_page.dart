import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:login_screen/viewmodel/about_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AboutPageModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/sbg-logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                'Stone Broke Games',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveBreakpoints.of(context).isMobile
                        ? 26
                        : ResponsiveBreakpoints.of(context).isTablet
                        ? 36
                        : 40
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40,),
                  ),
                  const SizedBox(height: 30,),
                  const Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                "Introduction:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Stone Broke Games is an innovative indie game studio founded by Ajo S S, dedicated to crafting unique and immersive gaming experiences.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                              ),
                              Text(
                                "\nCompany Mission:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Stone Broke Games specializes in creating pixel art 2D games. The studio is focused on creating games that push the boundaries of storytelling and gameplay.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                              ),
                              Text(
                                "\nAchievements and Vision:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Renowned for its commitment to quality and originality, Stone Broke Games has released two captivating games on the Play Store: CyberMage and Flutter Cave. The studio is also working on fresh and engaging projects available on itch.io, including two HTML games, Chrono-Loop Escape and Late for Meeting, and a Windows game, Frostfire Fury. Aiming to bring fresh and engaging content to gamers worldwide, Stone Broke Games continues to innovate and captivate the gaming community.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.exitAlert(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white
                        ),
                        child: const Center(
                          child: Text(
                            'Exit',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}