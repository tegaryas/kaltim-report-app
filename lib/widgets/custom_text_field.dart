// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaltim_report/theme.dart';
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
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
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
  final String? label;
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
      this.textFieldHeight = 200,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (label != null)
          SizedBox(
            height: 2.h,
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
        ),
      ],
    );
  }
}

class GhostDropdownTextField<T> extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final Function(T? value)? onChanged;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final String? Function(T? value)? validator;
  final void Function(T? value)? onSaved;
  final List<Widget> Function(BuildContext context)? selectedItemBuilder;
  final double? itemHeight;
  final double? menuMaxHeight;
  final bool isDense;
  const GhostDropdownTextField(
      {Key? key,
      this.prefixIcon,
      this.suffixIcon,
      this.readOnly = false,
      this.onChanged,
      this.value,
      this.items,
      this.onSaved,
      required this.label,
      required this.hint,
      this.validator,
      this.selectedItemBuilder,
      this.itemHeight,
      this.menuMaxHeight,
      this.isDense = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        DropdownButtonFormField<T>(
          value: value,
          isDense: isDense,
          itemHeight: itemHeight,
          menuMaxHeight: menuMaxHeight,
          validator: validator,
          onSaved: onSaved,
          onChanged: readOnly ? null : (value) => onChanged?.call(value),
          selectedItemBuilder: selectedItemBuilder,
          isExpanded: true,
          hint: Text(
            hint,
            style: GoogleFonts.montserrat(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textFaded,
            ),
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textFaded,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          style: GoogleFonts.montserrat(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textFaded,
          ),
          items: items,
        ),
      ],
    );
  }
}

class GhostPickerFieldValue<T> {
  final String name;
  final T? val;

  const GhostPickerFieldValue({required this.name, this.val});
}

class FormValueController<T> extends ChangeNotifier {
  T? _value;

  FormValueController({T? value}) {
    _value = value;
  }

  set value(T? val) {
    _value = val;
    notifyListeners();
  }

  T? get value {
    return _value;
  }
}

class GhostPickerField<T> extends StatefulWidget {
  final GhostPickerFieldValue<T>? Function(GhostPickerFieldValue<T>? value)?
      validator;
  final GhostPickerFieldValue<T>? initialValue;
  final void Function(GhostPickerFieldValue<T>? value)? onSaved;
  final void Function(GhostPickerFieldValue<T>? value)? onChanged;
  final String? label;
  final String hint;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final Future<GhostPickerFieldValue<T>?> Function(
      GhostPickerFieldValue<T>? value)? onTap;

  final FormValueController<GhostPickerFieldValue<T>>? controller;

  const GhostPickerField(
      {Key? key,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.initialValue,
      this.prefixWidget,
      this.suffixIcon,
      this.onTap,
      this.controller,
      this.label,
      required this.hint})
      : super(key: key);

  @override
  _GhostPickerFieldState<T> createState() => _GhostPickerFieldState<T>();
}

class _GhostPickerFieldState<T> extends State<GhostPickerField<T>> {
  late final TextEditingController controller;
  GhostPickerFieldValue<T>? currentValue;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      currentValue = widget.initialValue;
      controller = TextEditingController(text: currentValue?.name);
    } else {
      currentValue = widget.controller!.value;
      controller = TextEditingController(text: currentValue?.name);

      widget.controller!.addListener(() {
        setState(() {
          currentValue = widget.controller!.value;
          if (currentValue != null) {
            controller.text = currentValue!.name;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (widget.label != null)
          SizedBox(
            height: 0.5.h,
          ),
        TextFormField(
          validator: (value) {
            final val = widget.validator?.call(currentValue);
            return val?.name;
          },
          controller: controller,
          onTap: () async {
            final choosen = await widget.onTap?.call(currentValue);
            if (choosen != null) {
              controller.text = choosen.name;
              currentValue = choosen;
              widget.onChanged?.call(currentValue);
              widget.controller?.value = currentValue;
            }
          },
          readOnly: true,
          onSaved: (newValue) {
            widget.onSaved?.call(currentValue);
          },
          decoration: InputDecoration(
              prefixIcon: widget.prefixWidget,
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey.shade400,
                height: 1.2,
              ),
              suffixIcon: Icon(
                widget.suffixIcon,
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
        ),
      ],
    );
  }
}

class GhostCustomPickerField<T> extends StatefulWidget {
  final GhostPickerFieldValue<T>? Function(GhostPickerFieldValue<T>?)?
      validator;
  final GhostPickerFieldValue<T>? initialValue;
  final void Function(GhostPickerFieldValue<T>?)? onSaved;
  final String? label;
  final Widget Function(BuildContext, GhostPickerFieldValue<T>) selectedBuilder;
  final Widget Function(BuildContext) unselectedBuilder;

  final Future<GhostPickerFieldValue<T>?> Function(GhostPickerFieldValue<T>?)?
      onTap;

  const GhostCustomPickerField(
      {Key? key,
      this.onSaved,
      this.validator,
      this.initialValue,
      this.onTap,
      this.label,
      required this.selectedBuilder,
      required this.unselectedBuilder})
      : super(key: key);

  @override
  _GhostCustomPickerFieldState<T> createState() =>
      _GhostCustomPickerFieldState<T>();
}

class _GhostCustomPickerFieldState<T> extends State<GhostCustomPickerField<T>> {
  GhostPickerFieldValue<T>? currentValue;
  late final TextEditingController controller;
  bool isValid = true;

  @override
  void initState() {
    currentValue = widget.initialValue;
    controller = TextEditingController(text: currentValue?.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (widget.label != null) SizedBox(height: 0.5.h),
        Material(
          child: InkWell(
            onTap: () async {
              final choosen = await widget.onTap?.call(currentValue);
              if (choosen != null) {
                setState(() {
                  currentValue = choosen;
                  controller.text = choosen.name;
                });
              }
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    if (currentValue != null)
                      widget.selectedBuilder.call(context, currentValue!)
                    else
                      widget.unselectedBuilder.call(context),
                    SizedBox(height: isValid ? 0 : 25)
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: controller,
                      validator: (value) {
                        final val = widget.validator?.call(currentValue);
                        setState(() {
                          isValid = val?.name == null;
                        });
                        return val?.name;
                      },
                      readOnly: true,
                      onSaved: (newValue) {
                        widget.onSaved?.call(currentValue);
                      },
                      style:
                          const TextStyle(height: 1, color: Colors.transparent),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).errorColor)),
                        errorStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).errorColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
