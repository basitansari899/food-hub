// import 'package:ihprpm/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/ui_data.dart';


class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final validator;
  final String? labelText;
  final Color? fillcolor;
  final TextStyle ? textStyle;
  final String? textFieldHeading;
  final Color? bordercolor;
  final bool? isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final int? maxLength;
  final int  ? maxlines ;
  final toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final onTap;
  final prefixIconTap;
  final onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;

  CommonTextField(

      {this.controller,
        this.textFieldHeading,
        this.textStyle,
        this.maxlines = 1,
        this.validator,
        this.bordercolor,
        this.labelText,
        this.fillcolor,
        this.hintText,
        this.isTextHidden,
        this.buttonIcon,
        this.prefixIcon,
        this.onChanged,
        this.togglePassword = false,
        this.toggleFunction,
        this.toggleIcon,
        this.keyboardType,
        this.maxLength,
        this.readOnly,
        this.onTap,
        this.inputFormatters,
        this.prefixIconTap,
        this.focus});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textFieldHeading == null ? const SizedBox() : Row(children: [Text(textFieldHeading??'', style: TextStyle(fontWeight: FontWeight.w500,),)],),
        SpacingHeight.heightlistspacing10,
        TextFormField(
          style: textStyle,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          obscureText: isTextHidden! ,
          readOnly: readOnly == null ? false : true,
          onTap: onTap,
          maxLength: maxLength ,
          focusNode: focus,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: maxlines,

          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? GestureDetector(
              onTap: prefixIconTap,
              child: Icon(
                prefixIcon,
                color: Colors.black,
                size: 18.0,
              ),
            )
                : null,
            suffixIcon: togglePassword!
                ? GestureDetector(
                onTap: toggleFunction,
                child: Icon(
                  toggleIcon,
                size: 18.0,
                  color: Colors.black,
                ))
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: bordercolor ?? const Color(0xff757575).withOpacity(0.7),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: bordercolor ?? const Color(0xff757575).withOpacity(0.7),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            hintText: hintText,
            fillColor: fillcolor ?? const Color(0xff757575).withOpacity(0.7),
            filled: true,
            hintStyle:
            const TextStyle(
                color: Color(0xff9EA0A4),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins-Regular',
                letterSpacing: 0.0),
            contentPadding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 18.0),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black, fontSize: 15.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
          controller: controller,
          validator: validator,

        ),
      ],
    );
  }
}
