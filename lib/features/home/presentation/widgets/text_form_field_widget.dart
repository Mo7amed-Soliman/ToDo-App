import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 80,
          child: TextFormField(
            style: Theme.of(context).textTheme.displaySmall,
            controller: controller,
            validator: validator,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
