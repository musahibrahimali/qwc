import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/index.dart';

class CustomBarChart extends StatefulWidget {
  final List<SubscriberSeries> data;
  const CustomBarChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: widget.data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];

    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: BrandColors.colorBackground,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // makeTransactionsIcon(),
                  const SizedBox(width: 38.0),
                  const Text(
                    'Readings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      //both sowPopupWindow and createPopupWindow
                      showPopupWindow(
                        context,
                        gravity: KumiPopupGravity.rightCenter,
                        curve: Curves.elasticOut,
                        bgColor: Colors.grey.withOpacity(0.5),
                        clickOutDismiss: true,
                        clickBackDismiss: true,
                        customAnimation: false,
                        customPop: false,
                        customPage: false,
                        //targetRenderBox: (btnKey.currentContext.findRenderObject() as RenderBox),
                        needSafeDisplay: true,
                        underStatusBar: false,
                        underAppBar: true,
                        duration: const Duration(milliseconds: 200),
                        childFun: (pop) {
                          return Container(
                            width: 200.0,
                            height: 200.0,
                            key: GlobalKey(),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(height: 10.0),
                                const BrandDivider(),
                                InkWell(
                                  onTap: () {
                                    dataController.updateTitle(index: 1);
                                    pop.dismiss(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CustomText(
                                        text: "19 - 22",
                                        color: BrandColors.kBlackColor,
                                      ),
                                      CustomText(
                                        text: "Sept",
                                        color: BrandColors.kBlackColor,
                                      ),
                                    ],
                                  ),
                                ),
                                const BrandDivider(),
                                const SizedBox(height: 10.0),
                                // 5 - 9
                                InkWell(
                                  onTap: () {
                                    dataController.updateTitle(index: 2);
                                    pop.dismiss(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CustomText(
                                        text: "23 - 26",
                                        color: BrandColors.kBlackColor,
                                      ),
                                      CustomText(
                                        text: "Sept",
                                        color: BrandColors.kBlackColor,
                                      ),
                                    ],
                                  ),
                                ),
                                const BrandDivider(),
                                const SizedBox(height: 10.0),

                                // 10 - 14
                                InkWell(
                                  onTap: () {
                                    dataController.updateTitle(index: 3);
                                    pop.dismiss(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CustomText(
                                        text: "27 - 30",
                                        color: BrandColors.kBlackColor,
                                      ),
                                      CustomText(
                                        text: "Sept",
                                        color: BrandColors.kBlackColor,
                                      ),
                                    ],
                                  ),
                                ),
                                const BrandDivider(),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      LineAwesomeIcons.angle_down,
                      color: BrandColors.kLightGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 38.0),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: charts.BarChart(
                              series,
                              animate: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}
