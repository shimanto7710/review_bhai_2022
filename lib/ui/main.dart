import 'dart:async';
import 'dart:io';
import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:review_bhai_2022/api/dio/dio_helper.dart';
import 'package:review_bhai_2022/ui/confirm/confirm_pin.dart';
import 'package:review_bhai_2022/ui/login/login_screen.dart';
import 'package:review_bhai_2022/ui/user_details/user_details_screen.dart';
import '../SharedPref/prefManager.dart';
import '../api/repo.dart';
import '../constants/Constants.dart';
import '../core/MyColor.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home_screen/home_screen.dart';
import 'main_screen/main_screen.dart';

/*class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}*/

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.alice = Alice(
    showNotification: true,
    showInspectorOnShake: true,
    darkTheme: false,
    maxCallsCount: 1000,
  );
  // HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: DioHelper.alice.getNavigatorKey(),
      title: Constants.APP_TITLE,
      theme: ThemeData(
          primaryColor: CustomColors.primaryColor,
          accentColor: CustomColors.accentColor,
          fontFamily: 'Constantia'),
      initialRoute: SplashScreenView.routeName,
      routes: {
        SplashScreenView.routeName: (context) => const SplashScreenView(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        LoginScreen.routeName: (context) =>  UserDetailsScreen(id: ""),
        HomeScreen.routeName: (context) =>  const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      // main_screen: SplashScreenView(),
    );
  }
}

class SplashScreenView extends StatefulWidget {
  static const routeName = '/splashScreen';

  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenViewState();
  }
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 500),
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          'R E V I E W - B H A I',
          style: TextStyle(fontSize: 25, color: Colors.black54),
        ),
      ),
    );
  }

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPrefManager sp = SharedPrefManager();
    //await sp.setIsLoggedIn(false);
    bool isLogin = await sp.getIsLoggedIn();
    bool isCompleted = await sp.getIsCompletedInfo();
    print("isCompleted " + isCompleted.toString());
    print("isLogin " + isLogin.toString());
    if (isLogin) {
      if (isCompleted) {
        print("main_screen");
        // Navigator.of(context).pushReplacementNamed('/main_screen');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ));
      } else {
        // Navigator.of(context).pushReplacementNamed('/user_details');
        print("detail");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailsScreen(id: ""),
            ));
      }
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
      // print("login");
      // Navigator.of(context).pushReplacementNamed('/login_screen');
    }
  }
}
