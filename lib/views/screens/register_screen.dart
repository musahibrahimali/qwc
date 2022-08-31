import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/core/functions/helper_methods.dart';
import 'package:qwc/index.dart';

class RegisterScreen extends StatefulWidget {
  static String id = "register_screen";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // create a scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // firebase database reference
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  /// variables
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  /// boolean variables
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    _confirmPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.colorLightGray,
      key: _scaffoldKey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                    child: CustomText(
                      text: "QWC",
                      color: BrandColors.colorBlue,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: BrandColors.colorBackground,
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: const Offset(
                            0.5,
                            1.4,
                          ),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        const Image(
                          height: 100.0,
                          width: 100.0,
                          image: AssetImage(Assets.imagesProfileIcon),
                        ),
                        const SizedBox(height: 20.0),

                        /* full name  */
                        Container(
                          color: BrandColors.kInputFillColor,
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                            ),
                            controller: fullNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: BrandColors.kInputFillColor,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                                borderSide: BorderSide(
                                  color: BrandColors.kInputFillColor,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              labelText: 'Full Name',
                              prefixIcon: const Icon(
                                LineAwesomeIcons.user,
                                color: Colors.black,
                              ),
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),

                        /* email address */
                        Container(
                          color: BrandColors.kInputFillColor,
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                            ),
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: BrandColors.kInputFillColor,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                                borderSide: BorderSide(
                                  color: BrandColors.kInputFillColor,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              labelText: 'Email Address',
                              prefixIcon: const Icon(
                                LineAwesomeIcons.envelope,
                                color: Colors.black,
                              ),
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),

                        /* password field */
                        Container(
                          color: BrandColors.kInputFillColor,
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                            ),
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                                borderSide: BorderSide(
                                  color: BrandColors.kInputFillColor,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                LineAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible ? LineAwesomeIcons.eye_slash : LineAwesomeIcons.eye,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),

                        /* confirm password field */
                        Container(
                          color: BrandColors.kInputFillColor,
                          child: TextFormField(
                            obscureText: !_confirmPasswordVisible,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                                borderSide: BorderSide(
                                  color: BrandColors.kInputFillColor,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                              labelText: 'Confirm Password',
                              prefixIcon: const Icon(
                                LineAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _confirmPasswordVisible ? LineAwesomeIcons.eye_slash : LineAwesomeIcons.eye,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _confirmPasswordVisible = !_confirmPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),

                        /* register button */
                        BrandButton(
                          title: "register",
                          onPressed: () async {
                            // hide keyboard
                            FocusScope.of(context).unfocus();

                            if (fullNameController.text.length < 3) {
                              showFlushAlert(context, 'Please provide a valid full name');
                              return;
                            }

                            if (!emailController.text.trim().contains('@') || !emailController.text.trim().contains('.')) {
                              showFlushAlert(
                                context,
                                'Please provide a valid email address',
                              );
                              return;
                            }

                            if (passwordController.text.length < 8) {
                              showFlushAlert(
                                context,
                                'password must be at least 8 characters',
                              );
                              return;
                            }

                            if (passwordController.text != confirmPasswordController.text) {
                              showFlushAlert(
                                context,
                                'password do not match',
                              );
                              return;
                            }

                            showLoading(context);
                            try {
                              UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: emailController.text.trim().toString(),
                                password: passwordController.text.trim().toString(),
                              );
                              if (mounted) {}
                              //hide please wait dialog
                              Navigator.pop(context);
                              debugPrint(credential.toString());
                              userController.initUser();
                              if (credential.user != null) {
                                Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
                                DatabaseReference ref = FirebaseDatabase.instance.ref("users/${credential.user?.uid}");
                                //Prepare data to be saved on users table
                                Map userMap = {
                                  'fullname': fullNameController.text,
                                  'email': emailController.text.trim(),
                                };
                                ref.set(userMap);
                                // fetch the user data from the database
                                HelperMethods.instance.fetchUserProfile();
                              }
                            } on FirebaseAuthException catch (e) {
                              //hide please wait dialog
                              Navigator.pop(context);
                              if (e.code == 'weak-password') {
                                showFlushAlert(context, 'The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                showFlushAlert(context, 'The account already exists for that email.');
                              }
                            } catch (e) {
                              showFlushAlert(context, "something went wrong, try again later");
                              debugPrint(e.toString());
                            }
                          },
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  /*or get registered */
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                    },
                    child: Center(
                      child: Text(
                        "Already have an account ? Log In",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: BrandColors.kDarkColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),

                  /* log in with social media */
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1.5,
                              decoration: BoxDecoration(
                                color: BrandColors.kGrayColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          const Center(
                            child: Text(
                              "or",
                              style: TextStyle(fontSize: 22.0),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            child: Container(
                              height: 1.5,
                              decoration: BoxDecoration(
                                color: BrandColors.kGrayColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /* google */
                          Container(
                            width: 130.0,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: BrandColors.kWhiteColor,
                            ),
                            child: Center(
                              child: Text(
                                "Google".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: BrandColors.kDarkColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          /* facebook */
                          Container(
                            width: 130.0,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: BrandColors.kBlueColor,
                            ),
                            child: Center(
                              child: Text(
                                "Facebook".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: BrandColors.kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
