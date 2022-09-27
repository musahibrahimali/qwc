import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qwc/index.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as sizer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceInitializer.initServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userController.initUser();
    return sizer.ResponsiveSizer(builder: (BuildContext context, Orientation orientation, sizer.ScreenType screenType) {
      return RefreshConfiguration(
        footerTriggerDistance: 15,
        headerTriggerDistance: 60,
        dragSpeedRatio: 0.91,
        headerBuilder: () => const MaterialClassicHeader(),
        footerBuilder: () => const ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: GetMaterialApp(
          title: 'Water Quality Checker',
          debugShowCheckedModeBanner: false,
          theme: BrandThemes.lightTheme(context),
          darkTheme: BrandThemes.darkTheme(context),
          themeMode: ThemeMode.light,
          builder: (BuildContext context, Widget? child) {
            return ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: child!,
            );
          },
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('fr'),
            Locale('es'),
          ],
          locale: const Locale('en'),
          home: const SplashScreen(),
          routes: {
            /// [screens]
            SplashScreen.id: (context) => const SplashScreen(),
            RegisterScreen.id: (context) => const RegisterScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            HomeScreen.id: (context) => const HomeScreen(),

            /// [pages]
            TipsPage.id: (context) => const TipsPage(),
            HomePage.id: (context) => const HomePage(),
            ProfilePge.id: (context) => const ProfilePge(),
            MonitorPage.id: (context) => const MonitorPage(),
          },
        ),
      );
    });
  }
}
