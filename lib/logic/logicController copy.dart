import 'package:flutter/material.dart';
import 'package:game/structure/structure.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../core/constant.dart';

class LogiccController extends GetxController {
  bool isLevel2 = false;
  Structure structure = Structure();
  List<List<int>> level = [];
  List<List<int>> golas = [];
  @override
  void onInit() {
    if (Get.arguments == null) {
      level = levelown;
      golas = golasown;
    }
    super.onInit();
  }

  move(Structure s, String x, List level2, List golas2) {
    if (processGoals(level2, golas2)) {
      nextLevel();
    }
    List nextStates = s.getNextStates(level2);
    Structure st = nextStates[0];
    if (x == 'top') {
      if (st.movesArgs[0] == 1) {
        //move to top
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX - 1][structure.positionY] = 5;
        structure.positionX--;
        ////////
      } else if (st.movesArgs[0] == 2) {
        //move to top
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX - 1][structure.positionY] = 5;
        level2[structure.positionX - 2][structure.positionY] = 4;
        structure.positionX--;
        ////////
      } else {
        return Get.snackbar('Alert', 'Can\'t move to top',
            duration: const Duration(milliseconds: 800));
      }
    } else if (x == 'down') {
      if (st.movesArgs[2] == 1) {
        //move to down
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX + 1][structure.positionY] = 5;
        structure.positionX++;
        ////////
      } else if (st.movesArgs[2] == 2) {
        //move to down
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX + 1][structure.positionY] = 5;
        level2[structure.positionX + 2][structure.positionY] = 4;
        structure.positionX++;
        ////////
      } else {
        return Get.snackbar('Alert', 'Can\'t move to down');
      }
    } else if (x == 'right') {
      if (st.movesArgs[1] == 1) {
        //move to right
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX][structure.positionY + 1] = 5;
        structure.positionY++;
        ////////
      } else if (st.movesArgs[1] == 2) {
        //move to right
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX][structure.positionY + 1] = 5;
        level2[structure.positionX][structure.positionY + 2] = 4;
        structure.positionY++;
        ////////
      } else {
        return Get.snackbar('Alert', 'Can\'t move to right');
      }
    } else if (x == 'left') {
      if (st.movesArgs[3] == 1) {
        //move to left
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX][structure.positionY - 1] = 5;
        structure.positionY--;
        ////////
      } else if (st.movesArgs[3] == 2) {
        //move to left
        /////////
        level2[structure.positionX][structure.positionY] = 2;
        level2[structure.positionX][structure.positionY - 1] = 5;
        level2[structure.positionX][structure.positionY - 2] = 4;
        structure.positionY--;
        ////////
      } else {
        return Get.snackbar('Alert', 'Can\'t move to left');
      }
    }
    structure.path.add([structure.positionX, structure.positionY]);
    // print(structure.checkMoves());
    if (processGoals(level2, golas2)) {
      nextLevel();
    }
    update();
  }

  againGame() {
    structure.init();
    if (!isLevel2) {
      level = [
        [1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
        [1, 2, 2, 2, 1, 1, 1, 1, 1, 1],
        [1, 2, 4, 2, 1, 1, 2, 2, 2, 1],
        [1, 5, 2, 2, 1, 1, 4, 1, 2, 1],
        [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
        [1, 1, 1, 4, 2, 2, 2, 2, 2, 1],
        [0, 1, 2, 2, 2, 2, 1, 1, 1, 1],
        [0, 1, 2, 2, 2, 2, 2, 2, 1, 1],
        [0, 1, 2, 2, 2, 3, 3, 3, 1, 0],
        [0, 1, 1, 1, 1, 1, 1, 1, 1, 0],
      ];
      golas = golasown;
    } else {
      level = [
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [1, 2, 2, 1, 1, 2, 2, 2, 3, 1],
        [1, 2, 2, 4, 2, 2, 2, 2, 3, 1],
        [1, 5, 2, 2, 4, 2, 2, 2, 3, 1],
        [1, 2, 2, 4, 4, 2, 2, 2, 3, 1],
        [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
        [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
        [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
        [1, 2, 2, 2, 2, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
      ];
      golas = golastow;
    }
    update();
    print('again');
  }

  nextLevel() {
    Get.defaultDialog(
        textConfirm: 'Next Level',
        onConfirm: () {
          print('next..');
          isLevel2 = true;
          againGame();
          Get.back();
        },
        confirmTextColor: Colors.white,
        content: Center(
            child: Text(
          'The End Of Level\nThe Cost Is : ${structure.path.length} Step',
          style: TextStyle(
            fontSize: 17.sp,
          ),
        )));
    return;
  }

  bool processGoals(List level2, List golas2) {
    return structure.isFinal(level2, golas2);
  }
}
