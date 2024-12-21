import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../injection_container.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onTap;
  final void Function(String)? onSubmit;
  final String? labelText;
  final String? hintText;
  final bool autoComplete;

  const MySearchBar({
    super.key,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onSubmit,
    this.labelText,
    this.hintText,
    this.autoComplete = false,
  });
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    double myFontSize = 14.sp;
    double raduis = 12.r;
    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      alignment: Alignment.centerRight,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: colors.black,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (text) {
          // autoComplete == true
          //     ? onTap
          //     : Navigator.pushNamed(context, Routes.searchScreenRoute,
          //         arguments: FilterParams(
          //           text: text,
          //           reachMax: false,
          //         ));
        },
        onChanged: autoComplete == true ? onTap : null,
        decoration: InputDecoration(
          filled: true,
          fillColor: colors.backGroundFormFieldColor,
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
          hintStyle: theme.bodyMedium!.copyWith(
            color: colors.body,
            fontSize: myFontSize,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(raduis)),
            borderSide: BorderSide(
              color: colors.backGround,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(raduis)),
            borderSide: BorderSide(
              color: colors.backGround,
              width: 1.0,
            ),
          ),
        ),
        style: theme.bodyMedium!.copyWith(
          color: colors.body,
          fontSize: myFontSize,
        ),
      ),
    );
  }
}