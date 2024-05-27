import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../Utility/constant.dart';
import '../../colors/light_colors.dart';
import '../../utility/get_circle_avatar.dart';
import '../profile_page.dart';
import 'home_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late PersistentTabController _controller;

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Messages",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: "Settings",
          ),
        ),
      ];

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
          // screens: _buildScreens(),
          // items: _navBarsItems(),
          // confineInSafeArea: true,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          // navBarStyle: NavBarStyle.style4,
          tabs: <PersistentTabConfig>[],
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ) /*PersistentTabView(
          tabs: _tabs(),
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        )
*/
        );
  }


 }
