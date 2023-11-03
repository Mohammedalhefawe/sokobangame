import 'package:flutter/material.dart';
import 'package:game/core/constant.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../logic/logicController copy.dart';
import '../widget/control.dart';

class LevelTowScreen extends StatelessWidget {
  const LevelTowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Structure s = Structure();
    LogiccController controller = Get.put(LogiccController());
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.view_list_rounded),
          backgroundColor: Colors.teal,
          title: const Text('My Game'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.againGame();
                  controller.update();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: GetBuilder<LogiccController>(
            init: LogiccController(),
            builder: (controller) {
              return ListView(
                children: [
                  SafeArea(
                      child: Column(
                    children: [
                      Container(
                        height: 100.w,
                        width: 100.w,
                        color: Colors.brown,
                        child: Center(
                          child: Container(
                            height: 94.w,
                            width: 94.w,
                            color: Colors.white,
                            child: Column(
                                children: List.generate(10, (i) {
                              return Row(
                                children: List.generate(10, (j) {
                                  return Container(
                                    height: 9.4.w,
                                    width: 9.4.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                images[controller.level[i][j]]),
                                            fit: BoxFit.cover)),
                                    child: controller.level[i][j] == 3
                                        ? Icon(
                                            Icons.gps_not_fixed_sharp,
                                            color: Colors.orangeAccent,
                                            size: 17.sp,
                                          )
                                        : controller.level[i][j] == 5
                                            ? Icon(
                                                Icons.person,
                                                color: Colors.red,
                                                size: 17.sp,
                                              )
                                            : controller.level[i][j] == 4
                                                ? Icon(
                                                    Icons.circle,
                                                    color: Colors.blue,
                                                    size: 17.sp,
                                                  )
                                                : const SizedBox(),
                                  );
                                }),
                              );
                            })),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'path:',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        width: 100.w,
                        height: 6.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              controller.structure.path.length, (index) {
                            return Container(
                              margin: EdgeInsets.all(1.w),
                              height: 5.h,
                              width: 12.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.teal,
                              ),
                              child: Center(
                                child: Text(
                                  'x = ${controller.structure.path[index][0]}\ny = ${controller.structure.path[index][1]}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      ControlWidget(
                        top: () {
                          controller.move(controller.structure, 'top',
                              controller.level, controller.golas);
                        },
                        bottom: () {
                          controller.move(controller.structure, 'down',
                              controller.level, controller.golas);
                        },
                        left: () {
                          controller.move(controller.structure, 'left',
                              controller.level, controller.golas);
                        },
                        right: () {
                          controller.move(controller.structure, 'right',
                              controller.level, controller.golas);
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  )),
                ],
              );
            }));
  }
}
