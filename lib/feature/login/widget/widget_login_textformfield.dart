import 'package:flutter/material.dart';

Widget loginTextFormField({
  required BuildContext context,
  required String label,
  double? textScaleFactor,
  TextInputType? textInputType,
  TextEditingController? controller,
  bool? isObscure,
  Widget? prefixIcon,
  Widget? passwordVisibilityIconButton,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        textScaleFactor: textScaleFactor ?? 1,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isObscure ?? false,
        keyboardType: textInputType ?? TextInputType.text,
        cursorColor: Theme.of(context).textTheme.bodyMedium!.color,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff323645),
          errorStyle: TextStyle(color: Theme.of(context).errorColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: passwordVisibilityIconButton,
        ),
      ),
    ],
  );
}
