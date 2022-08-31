import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwc/index.dart';

class ProfilePge extends StatefulWidget {
  static const String id = 'profile_page';
  const ProfilePge({Key? key}) : super(key: key);

  @override
  State<ProfilePge> createState() => _ProfilePgeState();
}

class _ProfilePgeState extends State<ProfilePge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // background image
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage(Assets.imagesWaveBackground),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  const Image(
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage(Assets.imagesProfileIcon),
                  ),
                  const SizedBox(height: 40.0),
                  // user name
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: BrandColors.colorBackground,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Obx(
                          () => CustomText(
                            text: userController.currentUserInfo.fullName ?? "User Name",
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // user email
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: BrandColors.colorBackground,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Obx(
                          () => CustomText(
                            text: userController.currentUserInfo.email ?? "user@email.com",
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // logout button
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BrandButton(
                      width: MediaQuery.of(context).size.width * 0.96,
                      title: "Logout",
                      buttonColor: BrandColors.colorBlue,
                      borderRadius: 20.0,
                      onPressed: () {
                        // logout user
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
