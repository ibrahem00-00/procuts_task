import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/locale/app_localizations.dart';
import '../../injection_container.dart';

class MyDefaultButton extends StatelessWidget {
  final String? btnText;
  final bool localeText;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final bool isSelected;
  final double? height;
  final double? width;
  final String? svgAsset;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? borderColor;

  const MyDefaultButton({
    super.key,
    this.btnText,
    this.textStyle,
    required this.onPressed,
    this.color,
    this.isSelected = true,
    this.localeText = false,
    this.textColor,
    this.height,
    this.width,
    this.svgAsset,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    AppLocalizations locale = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width ?? screenWidth / 1.11,
      height: (height ?? 57.0).h,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius?.r ?? 15.r),
              side: BorderSide(
                color: borderColor ?? colors.upBackGround,
              ),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(color ?? colors.main),
          foregroundColor: WidgetStateProperty.all<Color>(
            textColor ?? colors.upBackGround,
          ),
        ),
        onPressed: onPressed,
        child: svgAsset == null
            ? Text(
                localeText ? btnText! : locale.text(btnText!),
                textAlign: TextAlign.center,
                style: textStyle ??
                    textTheme.bodyMedium!.copyWith(
                      color: textColor ?? colors.textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    svgAsset!,
                    height: 16.h,
                    width: 16.w,
                    colorFilter: ColorFilter.mode(
                      textColor ?? colors.upBackGround,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    localeText ? btnText! : locale.text(btnText!),
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        textTheme.bodyMedium!.copyWith(
                            color: textColor ?? colors.textColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                  ),
                ],
              ),
      ),
    );
  }
}
