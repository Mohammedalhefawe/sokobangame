import 'package:flutter/material.dart';

import 'package:level_map/level_map.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LevelMap(
          backgroundColor: Colors.grey,
          levelMapParams: LevelMapParams(
            levelCount: 4,
            currentLevel: 2.5,
            pathColor: Colors.white,
            currentLevelImage: ImageParams(
              path: "assets/images/alahlea.jpg",
              size: Size(40, 47),
              
            ),
            lockedLevelImage: ImageParams(
              path: "assets/images/numTrip1.png",
              size: Size(40, 42),
            ),
            completedLevelImage: ImageParams(
              path: "assets/images/alahlea.jpg",
              size: Size(40, 42),
            ),
            startLevelImage: ImageParams(
              path: "assets/images/alahlea.jpg",
              size: Size(60, 60),
            ),
            pathEndImage: ImageParams(
              path: "assets/images/alahlea.jpg",
              size: Size(60, 60),
            ),
            bgImagesToBePaintedRandomly: [
              ImageParams(
                  path: "assets/images/alahlea.jpg",
                  size: Size(80, 80),
                  repeatCountPerLevel: 0.5),
              ImageParams(
                  path: "assets/images/alahlea.jpg",
                  size: Size(80, 80),
                  repeatCountPerLevel: 0.25),
              ImageParams(
                  path: "assets/images/alahlea.jpg",
                  size: Size(80, 80),
                  repeatCountPerLevel: 0.25),
              ImageParams(
                  path: "assets/images/alahlea.jpg",
                  size: Size(80, 80),
                  repeatCountPerLevel: 0.25),
            ],
          ),
        ),
      ),
    );
  }
}
