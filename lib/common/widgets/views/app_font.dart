import 'package:flutter/material.dart';

class AppFont extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? lineHeight;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;

  const AppFont(
    this.text, {
    super.key,
    this.size = 13,
    this.fontWeight = FontWeight.normal,
    this.color = const Color.fromRGBO(11, 37, 33, 1),
    this.textAlign = TextAlign.left,
    this.maxLine,
    this.lineHeight,
    this.overflow,
    this.decoration,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        height: lineHeight,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
