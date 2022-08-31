import 'package:flutter/material.dart';
import 'package:qwc/index.dart';

class MonitorPage extends StatefulWidget {
  static const String id = 'monitor_page';
  const MonitorPage({Key? key}) : super(key: key);

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
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
                      fontSize: 30.0,
                    ),
                    const SizedBox(height: 15.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /// temperature and tds
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: RealTimeMonitorItem(
                                onTap: () {},
                                title: "TDS",
                              ),
                            ),
                            const SizedBox(width: 30.0),
                            Expanded(
                              child: RealTimeMonitorItem(
                                onTap: () {},
                                title: "TEMPERATURE",
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30.0),

                        /// ph and turbidity
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: RealTimeMonitorItem(
                                onTap: () {},
                                title: "PH",
                              ),
                            ),
                            const SizedBox(width: 30.0),
                            Expanded(
                              child: RealTimeMonitorItem(
                                onTap: () {},
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
                child: const CustomBarChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
