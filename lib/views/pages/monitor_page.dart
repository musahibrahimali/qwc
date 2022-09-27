import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qwc/index.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MonitorPage extends StatefulWidget {
  static const String id = 'monitor_page';
  const MonitorPage({Key? key}) : super(key: key);

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool isTDS = true;
  bool isTemperature = false;
  bool isPH = false;
  bool isTurbidity = false;
  List tdsList = [];
  List temperatureList = [];
  List phList = [];
  List turbidityList = [];

  // handle which tab should be active
  handleActive(int index) {
    setState(() {
      isTDS = false;
      isTemperature = false;
      isPH = false;
      isTurbidity = false;
      switch (index) {
        case 0:
          isTDS = true;
          break;
        case 1:
          isTemperature = true;
          break;
        case 2:
          isPH = true;
          break;
        case 3:
          isTurbidity = true;
          break;
        default:
          break;
      }
    });
  }

  @override
  void initState() {
    isTDS = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.colorBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: BrandColors.colorBlue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      text: "Real Time Monitor",
                      fontWeight: FontWeight.w900,
                      color: BrandColors.colorWhiteAccent,
                      fontSize: 2.0.h,
                    ),
                    SizedBox(height: 1.5.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /// temperature and tds
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: RealTimeMonitorItem(
                                  backgroundColor: isTDS ? BrandColors.colorPink : Colors.teal,
                                  titleColor: isTDS ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                                  onTap: () {
                                    handleActive(0);
                                  },
                                  title: "TDS",
                                ),
                              ),
                              SizedBox(width: 2.0.h),
                              Expanded(
                                child: RealTimeMonitorItem(
                                  backgroundColor: isTemperature ? BrandColors.colorPink : Colors.yellow,
                                  titleColor: isTemperature ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                                  onTap: () {
                                    handleActive(1);
                                  },
                                  title: "TEMPERATURE",
                                  fontSize: 1.6.h,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// ph and turbidity
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: RealTimeMonitorItem(
                                backgroundColor: isPH ? BrandColors.colorPink : BrandColors.kGrey,
                                titleColor: isPH ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                                onTap: () {
                                  handleActive(2);
                                },
                                title: "PH",
                              ),
                            ),
                            SizedBox(width: 2.0.h),
                            Expanded(
                              child: RealTimeMonitorItem(
                                backgroundColor: isTurbidity ? BrandColors.colorPink : Colors.brown,
                                titleColor: isTurbidity ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                                onTap: () {
                                  handleActive(3);
                                },
                                title: "TURBIDITY",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: BrandColors.colorBackground,
                child: Builder(builder: (BuildContext context) {
                  if (dataController.dataList.isNotEmpty) {
                    for (DataModel element in dataController.dataList) {
                      tdsList.add(element.tds?.round());
                      temperatureList.add(element.temperature?.round());
                      phList.add(element.pH?.round());
                      turbidityList.add(element.turbidity?.round());
                    }
                    // get the last four items of each list
                    tdsList = tdsList.sublist(tdsList.length - 4);
                    temperatureList = temperatureList.sublist(temperatureList.length - 4);
                    phList = phList.sublist(phList.length - 4);
                    turbidityList = turbidityList.sublist(turbidityList.length - 4);
                  }

                  if (isTDS && tdsList.isNotEmpty) {
                    return Obx(
                      () => CustomBarChart(
                        data: [
                          SubscriberSeries(
                            year: dataController.titleOne,
                            subscribers: tdsList[0] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleTwo,
                            subscribers: tdsList[1] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleThree,
                            subscribers: tdsList[2] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleFour,
                            subscribers: tdsList[3] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                        ],
                      ),
                    );
                  }

                  if (isTemperature && temperatureList.isNotEmpty) {
                    return Obx(
                      () => CustomBarChart(
                        data: [
                          SubscriberSeries(
                            year: dataController.titleOne,
                            subscribers: temperatureList[0] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleTwo,
                            subscribers: temperatureList[1] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleThree,
                            subscribers: temperatureList[2] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleFour,
                            subscribers: temperatureList[3] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                        ],
                      ),
                    );
                  }

                  if (isPH && phList.isNotEmpty) {
                    return Obx(
                      () => CustomBarChart(
                        data: [
                          SubscriberSeries(
                            year: dataController.titleOne,
                            subscribers: phList[0] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleTwo,
                            subscribers: phList[1] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleThree,
                            subscribers: phList[2] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleFour,
                            subscribers: phList[3] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                        ],
                      ),
                    );
                  }

                  if (isTurbidity && turbidityList.isNotEmpty) {
                    return Obx(
                      () => CustomBarChart(
                        data: [
                          SubscriberSeries(
                            year: dataController.titleOne,
                            subscribers: turbidityList[0] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleTwo,
                            subscribers: turbidityList[1] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleThree,
                            subscribers: turbidityList[2] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                          SubscriberSeries(
                            year: dataController.titleFour,
                            subscribers: turbidityList[3] ?? 0,
                            barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                          ),
                        ],
                      ),
                    );
                  }

                  return Obx(
                    () => CustomBarChart(
                      data: [
                        SubscriberSeries(
                          year: dataController.titleOne,
                          subscribers: 0,
                          barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                        ),
                        SubscriberSeries(
                          year: dataController.titleTwo,
                          subscribers: 0,
                          barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                        ),
                        SubscriberSeries(
                          year: dataController.titleThree,
                          subscribers: 0,
                          barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                        ),
                        SubscriberSeries(
                          year: dataController.titleFour,
                          subscribers: 0,
                          barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
