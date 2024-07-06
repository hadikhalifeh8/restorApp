import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/constant/color.dart';

class CustomTextSignUpORSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final Function()? onTap;
  const CustomTextSignUpORSignIn(
      {Key? key,
      required this.textone,
      required this.texttwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone.tr),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo.tr,
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
