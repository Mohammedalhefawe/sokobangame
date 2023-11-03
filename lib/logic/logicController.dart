// import 'package:game/structure/structure.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// import '../core/constant.dart';

// class LogicController extends GetxController {
//   Structure structure = Structure();
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   }

//   top(level2) {
//     print(structure.positionX);
//     if (structure.positionX > 0) {
//       if (level2[structure.positionX - 1][structure.positionY] == 2 ||
//           level2[structure.positionX - 1][structure.positionY] == 3) {
//         print('move..');
//         //move to top
//         /////////
//         level2[structure.positionX][structure.positionY] = 2;
//         level2[structure.positionX - 1][structure.positionY] = 5;
//         structure.positionX--;
//         ////////
//         structure.path.add([structure.positionX - 1, structure.positionY]);
//       } else if (level2[structure.positionX - 1][structure.positionY] == 4) {
//         if (structure.positionX - 2 >= 0) {
//           if (level2[structure.positionX - 2][structure.positionY] == 2 ||
//               level2[structure.positionX - 2][structure.positionY] == 3) {
//             print('move..');
//             //move to top
//             /////////
//             level2[structure.positionX][structure.positionY] = 2;
//             level2[structure.positionX - 1][structure.positionY] = 5;
//             level2[structure.positionX - 2][structure.positionY] = 4;
//             ////////
//             structure.positionX--;
//             structure.path.add([structure.positionX - 1, structure.positionY]);
//           }
//         }
//       }
//     }
//     processGoals();
//     print(structure.checkMoves());
//     update();
//   }

//   down(level2) {
//     print(structure.positionX);
//     if (structure.positionX < 9) {
//       if (level2[structure.positionX + 1][structure.positionY] == 2 ||
//           level2[structure.positionX + 1][structure.positionY] == 3) {
//         print('move..');
//         //move to down
//         /////////
//         level2[structure.positionX][structure.positionY] = 2;
//         level2[structure.positionX + 1][structure.positionY] = 5;
//         structure.positionX++;
//         ////////
//         structure.path.add([structure.positionX + 1, structure.positionY]);
//       } else if (level2[structure.positionX + 1][structure.positionY] == 4) {
//         if (structure.positionX + 2 <= 9) {
//           if (level2[structure.positionX + 2][structure.positionY] == 2 ||
//               level2[structure.positionX + 2][structure.positionY] == 3) {
//             print('move..');
//             //move to down
//             /////////
//             level2[structure.positionX][structure.positionY] = 2;
//             level2[structure.positionX + 1][structure.positionY] = 5;
//             level2[structure.positionX + 2][structure.positionY] = 4;

//             ////////
//             structure.path.add([structure.positionX + 1, structure.positionY]);
//             structure.positionX++;
//           }
//         }
//       }
//     }
//     processGoals();
//     print(structure.checkMoves());
//     update();
//   }

//   right(level2) {
//     print(structure.positionY);
//     if (structure.positionY < 9) {
//       if (level2[structure.positionX][structure.positionY + 1] == 2 ||
//           level2[structure.positionX][structure.positionY + 1] == 3) {
//         print('move..');
//         //move to top
//         /////////
//         level2[structure.positionX][structure.positionY] = 2;
//         level2[structure.positionX][structure.positionY + 1] = 5;
//         structure.positionY++;
//         ////////
//         structure.path.add([structure.positionX, structure.positionY + 1]);
//       } else if (level2[structure.positionX][structure.positionY + 1] == 4) {
//         if (structure.positionY + 2 <= 9) {
//           if (level2[structure.positionX][structure.positionY + 2] == 2 ||
//               level2[structure.positionX][structure.positionY + 2] == 3) {
//             print('move..');
//             //move to top
//             /////////
//             level2[structure.positionX][structure.positionY] = 2;
//             level2[structure.positionX][structure.positionY + 1] = 5;
//             level2[structure.positionX][structure.positionY + 2] = 4;

//             ////////
//             structure.path.add([structure.positionX, structure.positionY + 1]);
//             structure.positionY++;
//           }
//         }
//       }
//     }
//     processGoals();
//     print(structure.checkMoves());
//     update();
//   }

//   left(level2) {
//     print(structure.positionY);
//     if (structure.positionY > 0) {
//       if (level2[structure.positionX][structure.positionY - 1] == 2 ||
//           level2[structure.positionX][structure.positionY - 1] == 3) {
//         print('move..');
//         //move to top
//         /////////
//         level2[structure.positionX][structure.positionY] = 2;
//         level2[structure.positionX][structure.positionY - 1] = 5;
//         structure.positionY--;
//         ////////
//         structure.path.add([structure.positionX, structure.positionY - 1]);
//       } else if (level2[structure.positionX][structure.positionY - 1] == 4) {
//         if (structure.positionY - 2 >= 0) {
//           if (level2[structure.positionX][structure.positionY - 2] == 2 ||
//               level2[structure.positionX][structure.positionY - 2] == 3) {
//             print('move..');
//             //move to top
//             /////////
//             level2[structure.positionX][structure.positionY] = 2;
//             level2[structure.positionX][structure.positionY - 1] = 5;
//             level2[structure.positionX][structure.positionY - 2] = 4;

//             ////////
//             structure.path.add([structure.positionX, structure.positionY - 1]);
//             structure.positionY--;
//           }
//         }
//       }
//     }
//     processGoals();
//     print(structure.checkMoves());
//     update();
//   }

//   processGoals(level2,golas2) {
//     // ignore: unused_local_variable
//     int x = 0;
//     for (var value in golas2) {
//       if (level2[value[0]][value[1]] == 4) {
//         x++;
//       }
//       if (x == golas2.length) {
//         print('============================next level=======================');
//       }
//     }
//     for (var value in golas2) {
//       if (level2[value[0]][value[1]] == 2) {
//         level2[value[0]][value[1]] = 3;
//       }
//     }
//   }
// }
