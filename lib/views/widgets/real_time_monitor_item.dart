import 'package:flutter/material.dart';
import 'package:qwc/index.dart';

class RealTimeMonitorItem extends StatefulWidget {
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final void Function()? onTap;
  const RealTimeMonitorItem({
    Key? key,
    required this.title,
    this.titleSize,
    this.titleColor,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.onTap,
  }) : super(key: key);

  @override
  State<RealTimeMonitorItem> createState() => _RealTimeMonitorItemState();
}

class _RealTimeMonitorItemState extends State<RealTimeMonitorItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? BrandColors.colorBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: CustomText(
            text: widget.title,
            color: widget.titleColor ?? BrandColors.colorText,
            fontSize: widget.fontSize ?? 18.0,
            fontWeight: widget.fontWeight ?? FontWeight.w900,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
