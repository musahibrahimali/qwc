import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qwc/index.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  static String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool _isWaterSafe = false;
  @override
  void initState() {
    if (dataController.dataList.isEmpty) {
      HelperMethods.instance.subscribeToData('Data');
    }
    _isWaterSafe = false;
    super.initState();
  }

  // check if water is safe or unsafe
  void checkWater() {
    /// temperature must be between 15 - 30, ph must be between 6.5 - 8.0, turbidity must be between 0 - 5,
    ///tds must be between 0 - 1000 for the water to be safe
    /// if all conditions are met, the water is safe
    if (dataController.data.temperature! >= 15 &&
        dataController.data.temperature! <= 30 &&
        dataController.data.pH! >= 6.5 &&
        dataController.data.pH! <= 8.0 &&
        dataController.data.turbidity! >= 0 &&
        dataController.data.turbidity! <= 5 &&
        dataController.data.tds! >= 0 &&
        dataController.data.tds! <= 1000) {
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
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            physics: const BouncingScrollPhysics(),
            header: WaterDropMaterialHeader(
              distance: 40.0,
              color: BrandColors.colorDarkTheme,
              backgroundColor: const Color(0xff6078ff),
            ),
            onLoading: () async {
              // clear the schools list
              dataController.dataList.clear();
              HelperMethods.instance.subscribeToData("Data");
              if (mounted) {
                setState(() {});
              }
              _refreshController.loadComplete();
            },
            onRefresh: () async {
              // clear the schools list
              dataController.dataList.clear();
              // refresh the list
              HelperMethods.instance.subscribeToData("Data");
              if (dataController.dataList.isEmpty) {
                _refreshController.refreshCompleted();
              }
              // refresh failed
              _refreshController.refreshFailed();
            },
            dragStartBehavior: DragStartBehavior.start,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
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
                            color: BrandColors.colorWhiteAccent,
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
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5.0,
                          ),
                          margin: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 10.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 50.0),
                              // temperature
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    LineAwesomeIcons.low_temperature,
                                    color: BrandColors.colorWhiteAccent,
                                    size: 50.0,
                                  ),
                                  const SizedBox(width: 20.0),
                                  CustomText(
                                    text: "Temperature",
                                    color: BrandColors.colorWhiteAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 3.0.h,
                                  ),
                                  Obx(
                                    () => CustomText(
                                      text: dataController.data.temperature != null ? dataController.data.temperature.toString() : "0.0",
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    LineAwesomeIcons.tree,
                                    color: Colors.blue[400],
                                    size: 50.0,
                                  ),
                                  const SizedBox(width: 20.0),
                                  CustomText(
                                    text: "Turbidity",
                                    color: BrandColors.colorWhiteAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 3.0.h,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Obx(
                                    () => CustomText(
                                      text: dataController.data.turbidity != null ? dataController.data.turbidity.toString() : "0",
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    LineAwesomeIcons.infinity,
                                    color: BrandColors.colorPink,
                                    size: 50.0,
                                  ),
                                  const SizedBox(width: 20.0),
                                  CustomText(
                                    text: "TDS",
                                    color: BrandColors.colorWhiteAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 3.0.h,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Obx(
                                    () => CustomText(
                                      text: dataController.data.tds != null ? dataController.data.tds.toString() : "0",
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    LineAwesomeIcons.alternate_radiation,
                                    color: Colors.yellow[900],
                                    size: 50.0,
                                  ),
                                  const SizedBox(width: 20.0),
                                  CustomText(
                                    text: "PH",
                                    color: BrandColors.colorWhiteAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 3.0.h,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Obx(
                                    () => CustomText(
                                      text: dataController.data.pH != null ? dataController.data.pH.toString() : "0.0",
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
                          buttonColor: _isWaterSafe ? Colors.white.withOpacity(0.8) : BrandColors.kErrorColor,
                          titleColor: _isWaterSafe ? BrandColors.colorText.withOpacity(0.4) : BrandColors.colorWhiteAccent,
                          fontSize: 2.0.h,
                          borderRadius: 20.0,
                          title: "Unsafe",
                          onPressed: () {},
                        ),
                        BrandButton(
                          width: MediaQuery.of(context).size.width * 0.4,
                          buttonColor: _isWaterSafe ? BrandColors.colorBlue : Colors.white.withOpacity(0.8),
                          titleColor: _isWaterSafe ? Colors.white : BrandColors.colorText.withOpacity(0.4),
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
        ),
      ),
    );
  }
}
