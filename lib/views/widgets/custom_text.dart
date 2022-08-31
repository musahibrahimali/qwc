import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qwc/index.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final double? horizontalMargin;
  final double? verticalMargin;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.horizontalMargin,
    this.verticalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin ?? 5.0,
        vertical: verticalMargin ?? 5.0,
      ),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 1,
        style: GoogleFonts.montserrat(
          color: color ?? BrandColors.colorText,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 22.0,
          letterSpacing: letterSpacing ?? 0.0,
        ),
      ),
    );
  }
}
