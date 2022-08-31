import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/index.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isCollapsed;
  final double? height;

  const CustomDrawerHeader({
    Key? key,
    required this.isCollapsed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: height ?? 60.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const FlutterLogo(size: 30),
          if (isCollapsed) const SizedBox(width: 10),
          if (isCollapsed)
            Expanded(
              flex: 3,
              child: Obx(
                () => Text(
                  userController.currentUserInfo.fullName ?? 'User Name',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          if (isCollapsed) const Spacer(),
          if (isCollapsed)
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  LineAwesomeIcons.search,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
