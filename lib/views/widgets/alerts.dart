import 'package:another_flushbar/flushbar.dart';
import 'package:qwc/index.dart';

showFlushAlert(context, message, {bgColor, mgColor}) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    message: "$message",
    duration: const Duration(seconds: 3),
    messageColor: mgColor ?? BrandColors.baseColor,
    backgroundColor: bgColor ?? BrandColors.colorBackground,
  )..show(context);
}
