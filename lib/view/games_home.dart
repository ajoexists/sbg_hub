import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:login_screen/service/router/app_router.dart';

import 'package:login_screen/viewmodel/games_view_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class GameHomePage extends StatefulWidget {
  const GameHomePage({super.key});

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  List<GameListModel> games = [];

  void _getGameInfo() {
    games = GameListModel.getGameList();
  }

  @override
  Widget build(BuildContext context) {
    _getGameInfo();
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
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/sbg-logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Stone Broke Games',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Text(
                    'An Indie Game Studio dedicated to crafting immersive Pixel-Art games',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40,),
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      height: 40,
                      width: ResponsiveBreakpoints.of(context).isMobile
                          ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
                          : ResponsiveBreakpoints.of(context).screenWidth * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const AboutRoute());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white
                        ),
                        child: const Center(
                          child: Text(
                            'About Stone Broke Games',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                  height: ResponsiveBreakpoints.of(context).screenHeight * 1.15,
                  width: ResponsiveBreakpoints.of(context).isMobile
                      ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                      : ResponsiveBreakpoints.of(context).screenWidth * 0.8,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        height: ResponsiveBreakpoints.of(context).screenHeight * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          image: DecorationImage(
                            image: AssetImage(games[index].gameImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.all(20.0),
                                ),
                                Text(
                                  games[index].gameName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 3,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: ResponsiveBreakpoints.of(context).screenHeight * 0.03,),
                    itemCount: games.length,
                    padding: EdgeInsets.only(
                        left: ResponsiveBreakpoints.of(context).screenWidth * 0.1,
                        right: ResponsiveBreakpoints.of(context).screenWidth * 0.1
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}