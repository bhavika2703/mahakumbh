import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../Utility/constant.dart';
import '../../colors/light_colors.dart';
import '../../theme/theme_controller.dart';
import '../../utility/get_circle_avatar.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late PersistentTabController _controller;
  final ThemeController themeController = Get.find();

  List<Widget> _buildScreens() {
    return [
      const Center(child: Text('Home Screen')),
      const Center(child: Text('Search Screen')),
      const Center(child: Text('Profile Screen')),
    ];
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.home),
  //       title: "Home",
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.search),
  //       title: "Search",
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.person),
  //       title: "Profile",
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //   ];
  // }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        // centerTitle: true,
        leading: Image.asset(
          Assets.icColorDrawer,
          height: 1.0,
          width: 1.0,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for notification button
            },
          ),
          IconButton(
            icon: const Icon(Icons.circle),
            onPressed: () {
              // Action for search button
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Action for search button
            },
          ),
          const GetCircleAvatar(
            urlPrefix: "",
          )
        ],
      ),
      body: PersistentTabView(
        controller: _controller,
        // sc/reens: _buildScreens(),
        // items: _navBarsItems(),
        // confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : kBottomNavigationBarHeight,
        // hideNavigationBarWhenKeyboardShows: true,
        // decoration: NavBarDecoration(
        //   borderRadius: BorderRadius.circular(10.0),
        //   colorBehindNavBar: Colors.white,
        // ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        // itemAnimationProperties: ItemAnimationProperties(
        //   duration: Duration(milliseconds: 200),
        //   curve: Curves.ease,
        // ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        // navBarStyle: NavBarStyle.style6,
        tabs: [],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    ); /*PersistentTabView(
          tabs: _tabs(),
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        )
*/
  }
}

class SwitchController extends GetxController {
  final RxBool isSwitched = false.obs;

  void toggleSwitch() {
    isSwitched.value = !isSwitched.value;
  }
}
