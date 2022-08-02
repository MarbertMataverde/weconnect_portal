import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget globalTextFormField(
    {required BuildContext context,
    double? textScaleFactor,
    TextInputType? textInputType,
    TextEditingController? controller,
    bool? isObscure,
    Widget? prefixIcon,
    Widget? passwordVisibilityIconButton,
    String? hint,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormater}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    obscureText: isObscure ?? false,
    keyboardType: textInputType ?? TextInputType.text,
    inputFormatters: inputFormater,
    cursorColor: Theme.of(context).textTheme.bodyMedium!.color,
    style: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
    ),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color?.withAlpha(150)),
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
  );
}
