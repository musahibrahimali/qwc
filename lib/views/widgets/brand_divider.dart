import 'package:flutter/material.dart';
import 'package:qwc/index.dart';

class BrandDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  const BrandDivider({
    Key? key,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1.0,
      color: color ?? BrandColors.colorDefaultDivider,
      thickness: 1.0,
    );
  }
}
