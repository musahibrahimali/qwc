import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/index.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TipsPage extends StatefulWidget {
  static const String id = 'tips_page';
  const TipsPage({Key? key}) : super(key: key);

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesQwcBackground),
          fit: BoxFit.cover,
          // opacity: 0.4,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              // background image
              // Container(
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(Assets.imagesBackground),
              //       fit: BoxFit.cover,
              //       opacity: 0.4,
              //     ),
              //   ),
              // ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomText(
                        text: "TIPS",
                        fontSize: 48.0,
                        color: BrandColors.colorWhiteAccent,
                        fontWeight: FontWeight.w900,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              // position for content
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CustomText(
                        text: "WHO Guidelines",
                        color: BrandColors.colorWhiteAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                      ),
                      const SizedBox(height: 50.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        // decoration: BoxDecoration(
                        //   color: BrandColors.colorBackground,
                        //   borderRadius: BorderRadius.circular(20.0),
                        //   boxShadow: <BoxShadow>[
                        //     BoxShadow(
                        //       color: Colors.black.withOpacity(0.1),
                        //       blurRadius: 10.0,
                        //       spreadRadius: 5.0,
                        //       offset: const Offset(0.0, 10.0),
                        //     ),
                        //   ],
                        // ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // temperature
                            Row(
                              children: <Widget>[
                                Icon(
                                  LineAwesomeIcons.low_temperature,
                                  color: BrandColors.colorWhiteAccent,
                                  size: 50.0,
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                      text: "Temperature",
                                      color: BrandColors.colorWhiteAccent,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 3.5.h,
                                    ),
                                    const SizedBox(width: 10.0),
                                    CustomText(
                                      text: "15-30 degrees Celsius",
                                      color: BrandColors.kErrorColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 2.5.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // turbidity
                            const SizedBox(height: 20.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  LineAwesomeIcons.tree,
                                  color: Colors.blue[400],
                                  size: 50.0,
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                      text: "Turbidity",
                                      color: BrandColors.colorWhiteAccent,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 3.5.h,
                                    ),
                                    const SizedBox(width: 10.0),
                                    CustomText(
                                      text: "0-5 NTU",
                                      color: BrandColors.kErrorColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 2.5.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // tds
                            const SizedBox(height: 20.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  LineAwesomeIcons.infinity,
                                  color: BrandColors.colorPink,
                                  size: 50.0,
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                      text: "TDS",
                                      color: BrandColors.colorWhiteAccent,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 3.5.h,
                                    ),
                                    const SizedBox(width: 10.0),
                                    CustomText(
                                      text: "0-1000 mg/l",
                                      color: BrandColors.kErrorColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 2.5.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // ph
                            const SizedBox(height: 20.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  LineAwesomeIcons.alternate_radiation,
                                  color: Colors.yellow[900],
                                  size: 50.0,
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                      text: "PH",
                                      color: BrandColors.colorWhiteAccent,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 3.5.h,
                                    ),
                                    const SizedBox(width: 10.0),
                                    CustomText(
                                      text: "6.5 - 8.0",
                                      color: BrandColors.kErrorColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 2.5.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
