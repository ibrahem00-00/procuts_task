import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:procuts_task/core/utils/svg_manager.dart';

class PlusWidget extends StatelessWidget {
  final void Function() onTap;
  const PlusWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 56.h,
        width: 56.w,
        // padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: Colors.black),
        child: SvgPicture.asset(SvgAssets.plus),
      ),
    );
  }
}

class MinusWidget extends StatelessWidget {
  final void Function() onTap;
  const MinusWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 46.h,
        width: 46.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: Colors.black),
        child: SvgPicture.asset(SvgAssets.minus),
      ),
    );
  }
}
