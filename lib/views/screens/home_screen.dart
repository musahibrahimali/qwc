import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:qwc/core/functions/helper_methods.dart';
import 'package:qwc/index.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late PageController _controller;
  int selectedBottomBarIndex = 0;
  late List<Widget> pages;
  late List<BarItem> barItems;
  late Future<bool> future;

  Future<bool> loadPreferences() async {
    return true;
  }

  @override
  void initState() {
    super.initState();
    future = loadPreferences();
    if (userController.currentUserInfo.id == null) {
      HelperMethods.instance.fetchUserProfile();
    }
    pageController = PageController(initialPage: selectedBottomBarIndex);
    pages = [
      const HomePage(),
      const MonitorPage(),
      const TipsPage(),
      const ProfilePge(),
    ];
    barItems = [
      BarItem(
        icon: Icons.store_mall_directory,
        iconSize: 24,
        text: "Home",
        textSize: 18,
        color: Colors.purpleAccent[700],
      ),
      BarItem(
        icon: LineAwesomeIcons.bar_chart,
        iconSize: 24,
        text: "Monitor",
        textSize: 18,
        color: const Color(0xff6078ff),
      ),
      BarItem(
        icon: LineAwesomeIcons.bell,
        iconSize: 24,
        text: "Tips",
        textSize: 18,
        color: Colors.red,
      ),
      BarItem(
        icon: LineAwesomeIcons.user_shield,
        iconSize: 24,
        text: "Profile",
        textSize: 18,
        color: const Color(0xff009a88),
      ),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.colorBlue,
      extendBodyBehindAppBar: true,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: FutureBuilder<bool>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  selectedBottomBarIndex = index;
                  setState(() {
                    selectedBottomBarIndex = index;
                  });
                },
                controller: pageController,
                itemBuilder: (context, index) => pages[index],
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                semanticsLabel: "Loading preferences",
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        onItemTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
          );
        },
        barItems: barItems,
        currBarItem: selectedBottomBarIndex,
        animationDuration: const Duration(milliseconds: 150),
        elevation: 15,
      ),
    );
  }
}
