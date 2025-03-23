import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final String? errorText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? title;
  final FontWeight fontWeight;
  final int maxLines;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    this.prefixIcon,
    required this.label,
    this.suffixIcon,
    this.hintText,
    this.errorText,
    this.title,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? widget.label,
          style: TextStyle(fontWeight: widget.fontWeight),
        ),
        SizedBox(
          height: responsiveHeight(context, 46),

          child: TextField(
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            obscureText: _isObscured,
            controller: widget.controller,
            decoration: InputDecoration(
              labelText: widget.label,
              prefixIcon: widget.prefixIcon,
              suffixIcon:
                  widget.obscureText
                      ? IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      )
                      : widget.suffixIcon,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              errorText: widget.errorText,
            ),
          ),
        ),
      ],
    );
  }
}
