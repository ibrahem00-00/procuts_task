import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:procuts_task/injection_container.dart';

class Base64Image extends StatelessWidget {
  final String? img;
  const Base64Image({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: colors.backGroundFormFieldColor,
        border:
            img == null ? Border.all(width: 0.5.w, color: Colors.black) : null,
        image: img == null
            ? const DecorationImage(
                image: AssetImage('assets/images/user.jpeg'), fit: BoxFit.cover)
            : DecorationImage(
                image: MemoryImage(
                  base64Decode(img.toString()),
                ),
                fit: BoxFit.cover),
      ),
    );
  }
}
