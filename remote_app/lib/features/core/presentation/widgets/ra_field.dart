import 'package:flutter/material.dart';
import 'package:remote_app/features/core/presentation/widgets/ra_color.dart';

class RaField {
  static TextField hint({
    String hintText = "",
    TextEditingController? controller,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: RaColor.grey))),
    );
  }
}
