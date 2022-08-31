import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qwc/index.dart';

class BrandButton extends StatelessWidget {
  final String title;
  final Color? buttonColor;
  final Color? titleColor;
  final double? borderRadius;
  final void Function() onPressed;
  final double? width;
  final double? fontSize;
  const BrandButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonColor,
    this.borderRadius,
    this.width,
    this.fontSize,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: buttonColor ?? BrandColors.kDarkColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: GoogleFonts.poppins(
              color: titleColor ?? BrandColors.kWhiteColor,
              fontSize: fontSize ?? 24.0,
              fontWeight: FontWeight.w900,
              letterSpacing: 5.0,
            ),
          ),
        ),
      ),
    );
  }
}
