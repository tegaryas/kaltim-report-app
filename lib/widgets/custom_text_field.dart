import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NormalTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final bool? enabled;
  final bool readOnly;
  final void Function(String? val)? onSaved;
  final Function(dynamic)? onChanged;
  final TextInputType? keyboardType;
  final String label;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool isNotActive;

  const NormalTextField(
      {Key? key,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.initialValue,
      this.controller,
      this.enabled,
      this.readOnly = false,
      this.isNotActive = false,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      required this.label,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: isNotActive
              ? TextStyle(
                  fontSize: 10.sp,
                )
              : TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          validator: validator,
          initialValue: initialValue,
          controller: controller,
          enabled: enabled,
          readOnly: readOnly,
          onSaved: onSaved,
          keyboardType: keyboardType,
          style: isNotActive
              ? TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                )
              : TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final bool? enabled;
  final bool readOnly;
  final void Function(String? val)? onSaved;
  final TextInputType? keyboardType;
  final String label;
  final String? hint;
  final void Function(String val)? onChanged;

  const PasswordTextField(
      {Key? key,
      this.onSaved,
      this.validator,
      this.initialValue,
      this.controller,
      this.enabled,
      this.readOnly = false,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.hint,
      required this.label})
      : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        TextFormField(
          validator: widget.validator,
          initialValue: widget.initialValue,
          controller: widget.controller,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          obscureText: obscure,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: Icon(
                    obscure ? Icons.visibility : Icons.visibility_off,
                  )),
              hintText: widget.hint),
        ),
      ],
    );
  }
}

class ParagraphTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final bool? enabled;
  final bool readOnly;
  final void Function(String? val)? onSaved;
  final Function(dynamic)? onChanged;
  final TextInputType? keyboardType;

  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool isNotActive;
  final double? textFieldHeight;

  const ParagraphTextField(
      {Key? key,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.initialValue,
      this.controller,
      this.enabled,
      this.readOnly = false,
      this.isNotActive = false,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      required this.hint,
      this.textFieldHeight = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      initialValue: initialValue,
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      onSaved: onSaved,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.top,
      maxLines: null,
      maxLength: null,
      style: isNotActive
          ? TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 1.2,
            )
          : TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 5.0),
        ),
        hintMaxLines: null,
        hintStyle: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey.shade400,
          height: 1.2,
        ),
      ),
    );
  }
}
