import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qwc/index.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 15), () {
      if (userController.isUserLoggedIn) {
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: BrandColors.colorBlue,
              ),
            ),
            Positioned(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(180.0),
                      topRight: Radius.circular(280.0),
                      bottomLeft: Radius.circular(280.0),
                      bottomRight: Radius.circular(180.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5.0,
                        blurRadius: 15.0,
                        offset: const Offset(8.0, 5.0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Shimmer.fromColors(
                    baseColor: BrandColors.colorBlue,
                    highlightColor: Colors.blueAccent,
                    loop: 5,
                    child: Text(
                      'QWC',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: BrandColors.colorBlue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
