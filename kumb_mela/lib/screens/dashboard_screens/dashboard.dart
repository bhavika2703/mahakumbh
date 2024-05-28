import 'package:cuberto_bottom_bar/internal/cuberto_bottom_bar.dart';
import 'package:cuberto_bottom_bar/internal/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kumb_mela/screens/dashboard_screens/home_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../Utility/constant.dart';
import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/theme_controller.dart';
import '../../utility/get_circle_avatar.dart';
import '../../utility/size_config.dart';

class DashBoardPage extends StatefulWidget {
  final int initialIndex;

  const DashBoardPage({super.key, this.initialIndex = 0});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late PersistentTabController _controller;
  final ThemeController themeController = Get.find();
  int _currentIndex = 0;
  static List<Widget> _pages = [];

  List tabs = [];

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
    _currentIndex = widget.initialIndex;
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    tabs = [
      Tabs(
        icon: Icons.house,
        activeIcon: Icons.house,
        title: "Event",
        color: Colors.blue.shade900,
      ),
      Tabs(
        icon: Icons.calendar_month,
        activeIcon: Icons.calendar_month,
        title: "Map",
        color: Colors.blue.shade900,
      ),
      Tabs(
        icon: Icons.developer_board,
        activeIcon: Icons.developer_board,
        title: "Home",
        color: Colors.blue.shade900,
      ),
      Tabs(
        icon: Icons.menu,
        activeIcon: Icons.menu,
        title: "Guide",
        color: Colors.blue.shade900,
      ),
      // Tabs(
      //   icon: Icons.menu,
      //   activeIcon: Icons.menu,
      //   title: "You",
      //   color: Colors.blue.shade900,
      // ),
    ];
    _pages = [
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
      // const HomePage(),
    ];

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
      bottomNavigationBar: SizedBox(
        height: customDropdownTabletHeight(),
        child: CubertoBottomBar(

          padding: kEdgeInsetsSymmetricHV(v: 2, h: 2),
          key: const Key("BottomBar"),
          inactiveIconColor: kWhiteColor,

          barBackgroundColor: kDarkGreyColor,
          tabStyle: CubertoTabStyle.styleFadedBackground,
          selectedTab: _currentIndex,
          tabs: tabs
              .asMap()
              .entries
              .map((e) => TabData(
                    key: Key(e.value.title),
                    iconData: _currentIndex == e.key ? e.value.activeIcon : e.value.icon,
                    title: e.value.title,
                    tabColor: kWhiteColor,
                    /*tabGradient: getGradient(kOffWhiteColor)*/
                  ))
              .toList(),
          tabColor: kOffWhiteColor,
          textColor: kDarkGreyColor,
          onTabChangedListener: (position, title, color) {
            setState(() => _currentIndex = position);
          },
        ),
      )
      /* PersistentTabView(
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
      ),*/
      ,
      body: IndexedStack(index: _currentIndex, children: _pages),
    ); /*PersistentTabView(
          tabs: _tabs(),
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        )
*/
  }

  customDropdownTabletHeight() {
    return SizeConfig.screenWidth > 203 ? kSize(13) : null;
  }
}

class SwitchController extends GetxController {
  final RxBool isSwitched = false.obs;

  void toggleSwitch() {
    isSwitched.value = !isSwitched.value;
  }
}

class Tabs {
  final IconData icon;
  final IconData activeIcon;
  final String title;
  final Color color;
  final Gradient? gradient;

  Tabs({required this.activeIcon, required this.icon, required this.title, required this.color, this.gradient});
}


class MinimalExample extends StatelessWidget {
  const MinimalExample({super.key});

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const HomePage(),
      item: ItemConfig(
        icon: const Icon(Icons.home),
        title: "Home",
      ),
    ),
    PersistentTabConfig(
      screen: const HomePage(),
      item: ItemConfig(
        icon: const Icon(Icons.message),
        title: "Messages",
      ),
    ),
    PersistentTabConfig(
      screen: const HomePage(),
      item: ItemConfig(
        icon: const Icon(Icons.settings),
        title: "Settings",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
    tabs: _tabs(),
    navBarBuilder: (navBarConfig) => Style1BottomNavBar(
      navBarConfig: navBarConfig,
    ),
  );
}