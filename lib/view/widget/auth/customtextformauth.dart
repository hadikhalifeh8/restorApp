import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  //(hintText / label Text /Icon ) Dynamic  كلو لازم يكون
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscreText;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    Key? key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
    this.obscreText,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
          keyboardType: isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: valid,
          controller: mycontroller,
          obscureText: obscreText == null || obscreText == false ? false : true,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            hintText: hinttext.tr,
            hintStyle: const TextStyle(fontSize: 13.0),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9.0),
                child: Text(labeltext.tr)),
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          )),
    );
  }
}
