import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../logic/logicController copy.dart';

class ControlWidget extends StatelessWidget {
  final void Function()? top;
  final void Function()? left;
  final void Function()? right;
  final void Function()? bottom;

  const ControlWidget(
      {super.key, this.top, this.left, this.right, this.bottom});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogiccController>(
        init: LogiccController(),
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: 6.h,
                child: InkWell(
                  onTap: top,
                  child: Icon(
                    Icons.expand_less,
                    size: 50.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: left,
                      child: Icon(
                        Icons.navigate_before,
                        size: 50.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: right,
                      child: Icon(
                        Icons.navigate_next,
                        size: 50.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6.h,
                child: InkWell(
                  onTap: bottom,
                  child: Icon(
                    Icons.expand_more,
                    size: 50.sp,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
