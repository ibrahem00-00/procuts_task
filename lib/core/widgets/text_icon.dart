import 'package:flutter/material.dart';
import 'package:procuts_task/core/utils/values/text_styles.dart';
import 'package:procuts_task/core/widgets/gaps.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        Gaps.hGap10,
        Text(
          text,
          style: TextStyles.bold20(color: Colors.white),
        ),
      ],
    );
  }
}
