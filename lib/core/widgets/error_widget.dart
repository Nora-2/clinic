import 'package:clinic/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:clinic/core/utils/app_colors.dart';

// ignore: camel_case_types
class Error_Widget extends StatelessWidget {
  final VoidCallback? onPress;
  const Error_Widget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Center(
        //   child: LottieBuilder.asset(ImgAssets.error400),
        // ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'something went wrong',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: AppStrings.fontFamily),
          ),
        ),
        Text(
          'Try Again',
          style: TextStyle(
              color: AppColors.hint,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: AppStrings.fontFamily),
        ),
      ],
    );
  }
}
