import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odhani_design_sqt/utils/utils.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.hint, this.label, this.isOptional, this.focusNode, this.controller, this.onChanged, this.inputType, this.inputFormatters, this.isEnable, this.errorText, this.textInputAction, this.onEditingComplete, this.regex, this.validationMessage, required this.name, this.instructions, this.emptyMessage, this.isSecure, this.suffix, this.prefix, this.maxLength, this.readOnly, this.onTap, this.suffixIcon, this.validatorExtra, this.autofillHints}) : super(key: key);

  final String? hint;
  final String? label;
  final bool? isOptional;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isEnable;
  final String? errorText;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final String? regex;
  final String? validationMessage;
  final String name;
  final Iterable<String>? autofillHints;
  final String? instructions;
  final String? emptyMessage;
  final bool? isSecure;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final String? Function(String? value)? validatorExtra;

  String? validator(String? text) {
    if ((isOptional ?? true) && (text == null || text.isTrimEmpty)) return null;

    if (text == null) return emptyMessage ?? "Please Enter $name.";

    if (text.isTrimEmpty) return emptyMessage ?? "Please Enter $name.";

    if (regex != null) {
      final isMatch = RegExp(regex!).hasMatch(text);

      if (!isMatch) {
        return validationMessage ?? "Please Enter Valid $name.";
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnable == false ? 0.8 : 1.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.sp)
        ),
        child: TextFormField(
          cursorColor: kBlackColor,
          cursorHeight: 20.sp,
          onTap: onTap,
          readOnly: readOnly ?? false,
          maxLength: maxLength,
          obscureText: isSecure ?? false,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          enabled: isEnable,
          keyboardType: inputType,
          inputFormatters: inputFormatters,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          autofillHints: autofillHints,
          validator: (value) {

            if(validatorExtra != null) {
              final val = validatorExtra!(value);

              if(val != null) {
                return val;
              }
            }

            return validator(value);
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            counter: maxLength != null ? const SizedBox.shrink() : null,
            fillColor: kTextFiledFillColor,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: suffixIcon,
            suffix: suffix,
            labelText: label,
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
            border: OutlineInputBorder(borderSide:  BorderSide(color: txtBorderColor), borderRadius: BorderRadius.circular(100.sp)),
            disabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: txtBorderColor), borderRadius: BorderRadius.circular(100.sp)),
            enabledBorder: OutlineInputBorder(borderSide:  BorderSide(color: txtBorderColor), borderRadius: BorderRadius.circular(100.sp)),
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: kPrimaryColor), borderRadius: BorderRadius.circular(100.sp)),
          ),
        ),
      ),
    );
  }
}