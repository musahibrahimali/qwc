import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/index.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;
  TextEditingController feedbackController = TextEditingController();

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
                  Navigator.pop(context);
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
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 80,
                                  decoration: const InputDecoration(
                                    labelText: 'Your feedback',
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
                                  fontSize: 16.0,
                                ),
                              ),
                              Expanded(
                                child: BrandButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  title: 'send',
                                  fontSize: 16.0,
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
