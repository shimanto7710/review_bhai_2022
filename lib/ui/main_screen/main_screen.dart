import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_bhai_2022/ui/home_screen/home_screen.dart';
import 'package:review_bhai_2022/ui/home_screen/home_screen.dart';
import 'package:review_bhai_2022/ui/home_screen/home_screen.dart';

import '../../core/MyColor.dart';
import '../explore_screen/explore_screen.dart';
import '../que_ask_screen/que_ask_screen.dart';
import 'main_bloc.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc _bloc;
  var screenWidth;
  int currentIndex = 2;

  final List<Widget> _children = [
    const ExploreFragment(),
    const QueAskFragment(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    // AdditionFragment(),
    // NotificationFragment(),
  ];

  @override
  void initState() {
    _bloc = MainBloc(context);
  }

  @override
  void dispose() {
    super.dispose();

    //Close the Stream Sink when the widget is disposed
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );

    return BlocProvider<MainBloc>(
      create: (_) => _bloc,
      // ignore: missing_return
      child: BlocConsumer<MainBloc, MainState>(
        listener: (BuildContext context, MainState state) {
          // ignore: missing_return
        },
        // ignore: missing_return
        builder: (BuildContext context, MainState state) {
          return Scaffold(
            body:  _children[currentIndex],// new
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer),
                  label: 'Q&A',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notification',
                ),
              ],
              currentIndex: currentIndex,
              selectedItemColor: CustomColors.primaryColor,
              unselectedItemColor: Colors.grey,
              onTap: onTabTapped,
            ),

            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: 0, // this will be set when a new tab is tapped
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: new Icon(Icons.home),
            //       title: new Text('Home'),
            //     ),
            //     BottomNavigationBarItem(
            //       icon: new Icon(Icons.mail),
            //       title: new Text('Messages'),
            //     ),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.person),
            //         title: Text('Profile')
            //     )
            //   ],
            // ),
            // body: Stack(children: [
            //
            //   _children[currentIndex]  ,
            //   bottomNavigation(size),
            //
            // ],),
          );
        },
      ),
    );
  }


  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
