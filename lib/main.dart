import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwc/index.dart';

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
    return GetMaterialApp(
      title: 'Water Quality Checker',
      debugShowCheckedModeBanner: false,
      theme: BrandThemes.lightTheme(context),
      darkTheme: BrandThemes.darkTheme(context),
      themeMode: ThemeMode.light,
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
    );
  }
}
