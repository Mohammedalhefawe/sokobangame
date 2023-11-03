class Structure {
  late int positionX = 3, positionY = 1, cost;
  List<List<int>> path = [
    [3, 1]
  ];
  List movesArgs = [];
  List<List<bool>> visited = List.generate(
    10,
    (i) => List.generate(10, (j) => false),
  );

  void init() {
    positionX = 3;
    positionY = 1;
    movesArgs = [1, 1, 1, 1];
    path.clear();
    path.add([positionX, positionY]);
  }

  // check what is possible moves
  List checkMoves(List level2) {
    //============top===right===down===left
    movesArgs = [0, 0, 0, 0];
    if (positionX > 0) {
      if (level2[positionX - 1][positionY] == 2 ||
          level2[positionX - 1][positionY] == 3) {
        print('move..');
        //move to top
        /////////
        movesArgs[0] = 1;
        // movesArgs.add([positionX - 1, positionY]);
        ////////
      } else if (level2[positionX - 1][positionY] == 4) {
        if (positionX - 2 >= 0) {
          if (level2[positionX - 2][positionY] == 2 ||
              level2[positionX - 2][positionY] == 3) {
            print('move..');
            //move to top
            /////////
            movesArgs[0] = 2;
            // movesArgs.add([positionX - 1, positionY]);
            ////////
          }
        }
      }
    }
    if (positionX < 9) {
      if (level2[positionX + 1][positionY] == 2 ||
          level2[positionX + 1][positionY] == 3) {
        print('move..');
        //move to down
        /////////
        movesArgs[2] = 1;
        // movesArgs.add([positionX + 1, positionY]);
        ////////
      } else if (level2[positionX + 1][positionY] == 4) {
        if (positionX + 2 <= 9) {
          if (level2[positionX + 2][positionY] == 2 ||
              level2[positionX + 2][positionY] == 3) {
            print('move..');
            //move to down
            /////////
            movesArgs[2] = 2;
            //movesArgs.add([positionX + 1, positionY]);
            ////////
          }
        }
      }
    }

    if (positionY > 0) {
      if (level2[positionX][positionY - 1] == 2 ||
          level2[positionX][positionY - 1] == 3) {
        print('move left1');
        //move to left
        /////////
        movesArgs[3] = 1;
        ////////
      } else if (level2[positionX][positionY - 1] == 4) {
        if (positionY - 2 >= 0) {
          if (level2[positionX][positionY - 2] == 2 ||
              level2[positionX][positionY - 2] == 3) {
            print('move left2');
            //move to left
            /////////
            movesArgs[3] = 2;
            ////////
          }
        }
      }
    }
    if (positionY < 9) {
      if (level2[positionX][positionY + 1] == 2 ||
          level2[positionX][positionY + 1] == 3) {
        print('move..');
        //move to right
        /////////
        movesArgs[1] = 1;
        // movesArgs.add([positionX, positionY + 1]);
        ////////
      } else if (level2[positionX][positionY + 1] == 4) {
        if (positionY + 2 <= 9) {
          if (level2[positionX][positionY + 2] == 2 ||
              level2[positionX][positionY + 2] == 3) {
            print('move..');
            //move to right
            /////////
            movesArgs[1] = 2;
            // movesArgs.add([positionX, positionY + 1]);
            ////////
          }
        }
      }
    }
    return movesArgs;
  }

  void printMoves(List level2) {
    checkMoves(level2);
    // ignore: avoid_print
    print(movesArgs);
  }

  // check ability to move to the cell with position in arguments
  bool ableToMove(String x, List level2) {
    checkMoves(level2);
    if (x == 'top' && movesArgs[0] != 0) {
      return true;
    } else if (x == 'down' && movesArgs[1] != 0) {
      return true;
    } else if (x == 'right' && movesArgs[2] != 0) {
      return true;
    } else if (x == 'left' && movesArgs[3] != 0) {
      return true;
    }
    return false;
  }

  bool isFinal(List level2, List golas2) {
    int x = 0;
    for (var value in golas2) {
      if (level2[value[0]][value[1]] == 4) {
        x++;
      }
      if (x == golas2.length) {
        print('============================next level=======================');
        return true;
      }
    }
    for (var value in golas2) {
      if (level2[value[0]][value[1]] == 2) {
        level2[value[0]][value[1]] = 3;
      }
    }
    return false;
  }

  // change the position that in arguments, it's able to fall down to ground if the cell is a hole
  void move(String x, List level2) {
    if (ableToMove(x, level2)) {
      if (x == 'top') {
        path.add([positionX - 1, positionY]);
        positionX = positionX - 1;
      } else if (x == 'down') {
        path.add([positionX + 1, positionY]);
        positionX = positionX + 1;
      } else if (x == 'right') {
        path.add([positionX, positionY + 1]);
        positionY = positionY + 1;
      } else if (x == 'left') {
        path.add([positionX, positionY - 1]);
        positionY = positionY - 1;
      }
    }
  }

  void printStructure(List level2) {
    // ignore: unnecessary_brace_in_string_interps
    print("x: ${positionX}, y: ${positionY}");
    print("moves: ");
    printMoves(level2);
  }

  // copying the structure, by make a new object and copy all values to the new object, it's copying by value, not by reference
  Structure deepCopy() {
    Structure s = Structure();
    s.positionX = positionX;
    s.positionY = positionY;
    for (var value in movesArgs) {
      s.movesArgs.add(value);
    }
    for (var value in path) {
      s.path.add([value[0], value[1]]);
    }
    return s;
  }

  // trying the possible moves, and return a list of structures, each one is the result of one move
  List<Structure> getNextStates(List level2) {
    List<Structure> nextStates = [];
    checkMoves(level2);
    print(movesArgs);
    if (movesArgs[0] != 0) {
      Structure s1 = deepCopy();
      s1.move('top', level2);
      nextStates.add(s1);
    }
    if (movesArgs[1] != 0) {
      Structure s3 = deepCopy();
      s3.move('right', level2);
      nextStates.add(s3);
    }
    if (movesArgs[2] != 0) {
      Structure s4 = deepCopy();
      s4.move('down', level2);
      nextStates.add(s4);
    }

    if (movesArgs[3] != 0) {
      Structure s2 = deepCopy();
      s2.move('left', level2);
      nextStates.add(s2);
    }

    return nextStates;
  }
}
