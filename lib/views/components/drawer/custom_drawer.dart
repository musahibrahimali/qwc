import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/index.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  final TextEditingController feedbackController = TextEditingController();
  List<String> attachments = [];
  bool isHTML = false;

  final TextEditingController recipientController = TextEditingController(text: 'quedjofrempong@gmail.com');
  final TextEditingController subjectController = TextEditingController(text: '${userController.currentUserInfo.fullName} - Feedback');

  Future<void> sendMail() async {
    FocusScope.of(context).unfocus();
    showLoading(context);
    final Email email = Email(
      body: feedbackController.text,
      subject: subjectController.text,
      recipients: [recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    try {
      await FlutterEmailSender.send(email);
      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      showFlushAlert(context, "Thank you for your feedback");
      feedbackController.text = "";
    } catch (error) {
      debugPrint(error.toString());
      Navigator.pop(context);
      showFlushAlert(context, "There was an error sending feedback");
    }
  }

  void handleFeedback() {
    // show a dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: CustomText(
              text: 'Help & Feedback',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: BrandColors.colorText,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsOverflowDirection: VerticalDirection.down,
          elevation: 10.0,
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // add an input text field
                  TextFormField(
                    controller: feedbackController,
                    keyboardType: TextInputType.text,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Get in touch with us',
                      labelStyle: GoogleFonts.poppins(
                        color: BrandColors.colorText,
                        fontSize: 1.5.h,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Your feedback",
                      hintStyle: GoogleFonts.poppins(
                        color: BrandColors.colorText.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: BrandButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'cancel',
                    buttonColor: Colors.transparent,
                    titleColor: BrandColors.colorPink,
                    fontSize: 1.3.h,
                  ),
                ),
                Expanded(
                  child: BrandButton(
                    onPressed: () {
                      sendMail();
                    },
                    title: 'send',
                    fontSize: 1.3.h,
                    buttonColor: Colors.transparent,
                    titleColor: BrandColors.colorPink,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color.fromRGBO(20, 20, 20, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(
                isCollapsed: _isCollapsed,
              ),
              const SizedBox(height: 20.0),
              BrandDivider(color: BrandColors.kLightGray),
              const SizedBox(height: 20.0),
              CustomListTile(
                onTap: () {
                  Navigator.pop(context);
                  pageController.animateToPage(
                    0,
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOutCubic,
                  );
                },
                isCollapsed: _isCollapsed,
                icon: LineAwesomeIcons.home,
                title: 'Home',
                infoCount: 0,
              ),
              CustomListTile(
                onTap: () {
                  Navigator.pop(context);
                  pageController.animateToPage(
                    1,
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOutCubic,
                  );
                },
                isCollapsed: _isCollapsed,
                icon: LineAwesomeIcons.desktop,
                title: 'Monitor',
                infoCount: 0,
              ),
              CustomListTile(
                onTap: () {
                  Navigator.pop(context);
                  pageController.animateToPage(
                    2,
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOutCubic,
                  );
                },
                isCollapsed: _isCollapsed,
                icon: LineAwesomeIcons.info_circle,
                title: 'Tips',
                infoCount: 0,
              ),
              CustomListTile(
                onTap: () {
                  handleFeedback();
                },
                isCollapsed: _isCollapsed,
                icon: LineAwesomeIcons.helping_hands,
                title: 'Help & Feedback',
                infoCount: 0,
              ),
              const SizedBox(height: 20.0),
              BrandDivider(color: BrandColors.kLightGray),
              const SizedBox(height: 20.0),
              const Spacer(),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.settings,
                title: 'Settings',
                infoCount: 0,
              ),
              const SizedBox(height: 10),
              BottomUserInfo(isCollapsed: _isCollapsed),
              Align(
                alignment: _isCollapsed ? Alignment.bottomRight : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed ? LineAwesomeIcons.angle_double_left : LineAwesomeIcons.angle_double_right,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
