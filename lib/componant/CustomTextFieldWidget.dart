import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../utils/Themes.dart';
import '../utils/style.dart';

Widget SharedFromTextField({
  Function()? onTapFunction,
  String? Function(String? value)? onTapValidator,
  Function(String)? onChanged,
  Function()? onTapsuffixIcon,
  Function? validator,
  TextEditingController? Controller,
  int? maxLines,
  TextInputType? keyboardType,
  IconData? prefixIcon,
  IconData? suffixIcon,
  String? labelText,
  String? hintText,
  double? height,
  TextAlign textAlign = TextAlign.start,
  bool isPassword = false,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: height,
        child: TextFormField(
          onChanged: onChanged,
          onTap: onTapFunction,
          controller: Controller,
          maxLines: maxLines,
          minLines: 1,
          style: TextStyle(fontSize: 19, color: Themes.ColorApp4),
          textAlign: textAlign,
          validator: onTapValidator,
          obscureText: isPassword,
          keyboardType: keyboardType,
          maxLength: 1,
          decoration: InputDecoration(
              hoverColor: Themes.ColorApp4,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Themes.ColorApp12,
                  width: 1.0
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Themes.ColorApp12,
                  width: 1.0,
                ),
              ),
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              hintText: hintText,
              errorStyle: TextStyle(color: Colors.white),
              labelText: labelText),
        ),
      ),
    );


class FromTextShared extends StatelessWidget {
  Function()? onTapFunction;
  String? Function(String? value)? onTapValidator;
  Function(String)? onChanged;
  Function()? onTapsuffixIcon;
  Function? validator;
  TextEditingController? Controller;
  int? maxLines;
  int? maxLength;
  TextInputType? keyboardType;
  IconData? prefixIcon;
  IconData? suffixIcon;
  FocusNode? focusNode;
  String? labelText;
  String? hintText;
  TextAlign? textAlign = TextAlign.start;
  bool? isPassword = false;

  FromTextShared(
      { this.onTapFunction,
       this.onTapValidator,
       this.onChanged,
      this.onTapsuffixIcon,
       this.validator,
      required this.Controller,
       this.maxLines,
       this.maxLength,
        this.focusNode,
      required this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      required this.labelText,
      required this.hintText,
       this.textAlign,
        this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTapFunction,
        focusNode: focusNode,
        controller: Controller,
        maxLines: maxLines,
        minLines: 1,
        maxLength: maxLength,
        style: TextStyle(fontSize: 15, color: primaryColor),
        validator: onTapValidator,
        obscureText: isPassword!,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.lightBlue,
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    color: Colors.lightBlue,
                    onPressed: onTapsuffixIcon,
                  )
                : null,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: primaryColor, width: 1)),
            labelText: labelText),
      ),
    );
  }
}

class FromTextSeaarchedShared extends StatelessWidget {
  FromTextSeaarchedShared(
      {this.validator,
      this.textAlign,
      this.suffixIcon,
      this.prefixIcon,
      this.onTapsuffixIcon,
      this.onTapFunction,
      this.maxLines,
      this.keyboardType,
      this.fontSize,
      this.Controller,
      this.hintText,
      this.onChangedFunction,
      this.onEditingComplete,
      this.prefixIconColor});

  Function()? onTapFunction;
  Function()? onEditingComplete;
  Function(String)? onChangedFunction;
  Function()? onTapsuffixIcon;
  Function? validator;
  Color? prefixIconColor;
  String? hintText;
  TextEditingController? Controller;
  int? maxLines;
  double? fontSize = 17;
  TextInputType? keyboardType;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextAlign? textAlign = TextAlign.start;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTapFunction,
      onChanged: onChangedFunction,
      controller: Controller,
      maxLines: maxLines,
      minLines: 1,
      onEditingComplete: onEditingComplete,
      style: TextStyle(fontSize: fontSize, color: Colors.blueGrey),
      textAlign: textAlign!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onTapsuffixIcon,
              )
            : null,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(0),
        //   // borderSide: BorderSide(
        //   //     color: Colors.blueGrey.shade600,
        //   //     width: 1,
        //   //     style: BorderStyle.solid
        //   // )
        // ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function()? press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'don`t have account' : 'already have Account',
          style: TextStyle(color: primaryColor, fontSize: 15),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'sign up' : 'sign in',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }
}

class FromTextRequestShared extends StatelessWidget {
  Function()? onTapFunction;
  String? Function(String? value)? onTapValidator;
  Function(String)? onChanged;
  Function()? onTapsuffixIcon;
  Function? validator;
  TextEditingController? Controller;
  int? maxLines;
  TextInputType? keyboardType;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Color? TextColor = primaryColor;
  String? labelText;
  String? hintText;
  double? height;
  TextAlignVertical? textAlignVertical;
  TextAlign? textAlign = TextAlign.start;
  int? minLines = 5;
  bool? isPassword = false;

   FromTextRequestShared({this.height,this.hintText,this.Controller,this.keyboardType,this.maxLines,this.onTapFunction,this.onTapsuffixIcon,
   this.prefixIcon,this.suffixIcon,this.textAlign,this.validator,this.onTapValidator,this.onChanged,this.labelText,this.isPassword,this.minLines,
   this.textAlignVertical,this.TextColor});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTapFunction,
        controller: Controller,
        textAlignVertical: textAlignVertical,
        style: TextStyle(fontSize: 15, color: TextColor,height: height,
        ),
        textAlign: textAlign!,
        maxLines: 10,
        minLines: minLines,
        validator: onTapValidator,
        obscureText: isPassword!,
        keyboardType: keyboardType,
        expands: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle:TextStyle(fontSize: 15, color: primaryColor,height: height,
            ),
            alignLabelWithHint: true,
            suffixIcon: suffixIcon != null
                ? IconButton(
              icon: Icon(suffixIcon),
              color: primaryColor,
              onPressed: onTapsuffixIcon,
            )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                    color: primaryColor,
                    width: 1,
                    style: BorderStyle.solid)),
            labelText: labelText),
      ),
    );
  }
}