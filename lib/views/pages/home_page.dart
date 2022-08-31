import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/core/functions/helper_methods.dart';
import 'package:qwc/index.dart';

class HomePage extends StatefulWidget {
  static String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isWaterSafe = false;
  @override
  void initState() {
    HelperMethods.instance.subscribeToData('data');
    _isWaterSafe = false;
    super.initState();
  }

  // check if water is safe or unsafe
  void checkWater() {
    /// temperature must be between 15 - 30, ph must be between 6.5 - 8.0, turbidity must be between 0 - 5,
    ///tds must be between 0 - 1000 for the water to be safe
    /// if all conditions are met, the water is safe
    if (double.tryParse(dataController.data.temperature!)! >= 15 &&
        double.tryParse(dataController.data.temperature!)! <= 30 &&
        double.tryParse(dataController.data.pH!)! >= 6.5 &&
        double.tryParse(dataController.data.pH!)! <= 8.0 &&
        double.tryParse(dataController.data.turbidity!)! >= 0 &&
        double.tryParse(dataController.data.turbidity!)! <= 5 &&
        double.tryParse(dataController.data.tds!)! >= 0 &&
        double.tryParse(dataController.data.tds!)! <= 1000) {
      setState(() {
        _isWaterSafe = true;
      });
    } else {
      setState(() {
        _isWaterSafe = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (dataController.data.temperature != null) {
      checkWater();
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            children: <Widget>[
              // background image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesBackground),
                    fit: BoxFit.cover,
                    opacity: 0.4,
                  ),
                ),
              ),
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
                        text: "Fast Analyser",
                        fontSize: 42.0,
                        color: BrandColors.colorText,
                        fontWeight: FontWeight.w700,
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: BrandColors.colorBackground,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: const Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 50.0),
                          // temperature
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                LineAwesomeIcons.low_temperature,
                                color: BrandColors.colorText,
                                size: 50.0,
                              ),
                              CustomText(
                                text: "Temperature",
                                color: BrandColors.colorText,
                                fontWeight: FontWeight.w700,
                                fontSize: 28.0,
                              ),
                              Obx(
                                () => CustomText(
                                  text: dataController.data.temperature ?? "0.0",
                                  color: BrandColors.kErrorColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                          // turbidity
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                LineAwesomeIcons.tree,
                                color: Colors.blue[400],
                                size: 50.0,
                              ),
                              const SizedBox(width: 20.0),
                              CustomText(
                                text: "Turbidity",
                                color: BrandColors.colorText,
                                fontWeight: FontWeight.w700,
                                fontSize: 28.0,
                              ),
                              const SizedBox(width: 10.0),
                              Obx(
                                () => CustomText(
                                  text: dataController.data.turbidity ?? "0",
                                  color: BrandColors.kErrorColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),

                          // tds
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                LineAwesomeIcons.infinity,
                                color: BrandColors.colorPink,
                                size: 50.0,
                              ),
                              const SizedBox(width: 20.0),
                              CustomText(
                                text: "TDS",
                                color: BrandColors.colorText,
                                fontWeight: FontWeight.w700,
                                fontSize: 28.0,
                              ),
                              const SizedBox(width: 10.0),
                              Obx(
                                () => CustomText(
                                  text: dataController.data.tds ?? "0",
                                  color: BrandColors.kErrorColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),

                          // ph
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                LineAwesomeIcons.alternate_radiation,
                                color: Colors.yellow[900],
                                size: 50.0,
                              ),
                              const SizedBox(width: 20.0),
                              CustomText(
                                text: "PH",
                                color: BrandColors.colorText,
                                fontWeight: FontWeight.w700,
                                fontSize: 28.0,
                              ),
                              const SizedBox(width: 10.0),
                              Obx(
                                () => CustomText(
                                  text: dataController.data.pH ?? "0.0",
                                  color: BrandColors.kErrorColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // bottom button
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BrandButton(
                      width: MediaQuery.of(context).size.width * 0.4,
                      buttonColor: _isWaterSafe ? Colors.red.withOpacity(0.4) : BrandColors.kErrorColor,
                      fontSize: 20.0,
                      borderRadius: 20.0,
                      title: "Unsafe",
                      onPressed: () {},
                    ),
                    BrandButton(
                      width: MediaQuery.of(context).size.width * 0.4,
                      buttonColor: _isWaterSafe ? BrandColors.colorBlue : Colors.blue.withOpacity(0.4),
                      fontSize: 20.0,
                      borderRadius: 20.0,
                      title: "safe",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
