import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/theme/padding.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../Utility/constant.dart';
import '../theme/text_style.dart';
import '../widgets/get_circle_avatar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // late PersistentTabController _controller;

  @override
  void initState() {
    // _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Profile",
                style: kBold4BlackTextStyle().apply(color: kWhiteColor),
              ),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              leading: Image.asset(
                Assets.icDrawerIcon,
                height: kSize(3),
                width: kSize(3),
              ),
              actions: [
                Padding(
                  padding: kEdgeInsetsSymmetricHV(h: 2),
                  child: const Icon(Icons.notifications),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: kEdgeInsetsAll(2),
                                child: GetCircleAvatar(
                                  size: kSize(6),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              kSizedBox(height: 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Abhay Sharma",
                                    style: kBold3BlackTextStyle(),
                                  ),
                                  kSizedBox(width: 2),
                                  const Icon(Icons.edit)
                                ],
                              ),
                              kSizedBox(height: 2),
                              _widgetDrawerOption(
                                  image: Assets.icRegistration,
                                  head: "Registration",
                                  detail: "Register your account for more Info "),
                              _widgetDrawerOption(
                                  image: Assets.icRegistration,
                                  head: "Upload your current photo",
                                  detail: "This will enhance your safety"),
                              _widgetDrawerOption(
                                  image: Assets.icRegistration, head: "Form", detail: "Further secure your account for safety"),
                              _widgetDrawerOption(
                                  image: Assets.icRegistration, head: "Privacy", detail: "Manage your account privacy"),
                              _widgetDrawerOption(
                                  image: Assets.icRegistration,
                                  head: "Security",
                                  detail: "Further secure your account for safety"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // _widgetTabBar()
              ],
            )));
  }

  Widget _widgetDrawerOption({image, head, detail}) {
    return Padding(
      padding: kEdgeInsetsAll(2),
      child: Column(
        children: [
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: kEdgeInsetsAll(2),
                  child: Image.asset(
                    image,
                    width: kSize(7),
                    height: kSize(7),
                  ),
                ),
                kSizedBox(width: 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(head, style: kBold2BlackTextStyle()),
                      Text(detail, style: kMedium2BlackTextStyle()),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kGreyColor7,
                )
              ],
            ),
          ),
          kSizedBox(height: 2)
        ],
      ),
    );
  }

  // Widget _widgetTabBar() {
  //   return PersistentTabView(
  //     context,
  //     controller: _controller,
  //     screens: _buildScreens(),
  //     items: _navBarsItems(),
  //     confineInSafeArea: true,
  //     backgroundColor: Colors.white,
  //     // Default is Colors.white.
  //     handleAndroidBackButtonPress: true,
  //     // Default is true.
  //     resizeToAvoidBottomInset: true,
  //     // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  //     stateManagement: true,
  //     // Default is true.
  //     hideNavigationBarWhenKeyboardShows: true,
  //     // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  //     decoration: NavBarDecoration(
  //       borderRadius: BorderRadius.circular(10.0),
  //       colorBehindNavBar: Colors.white,
  //     ),
  //     popAllScreensOnTapOfSelectedTab: true,
  //     popActionScreens: PopActionScreensType.all,
  //     itemAnimationProperties: const ItemAnimationProperties(
  //       // Navigation Bar's items animation properties.
  //       duration: Duration(milliseconds: 200),
  //       curve: Curves.ease,
  //     ),
  //     screenTransitionAnimation: const ScreenTransitionAnimation(
  //       // Screen transition animation on change of selected tab.
  //       animateTabTransition: true,
  //       curve: Curves.ease,
  //       duration: Duration(milliseconds: 200),
  //     ),
  //     navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
  //   );
  // }

  List<Widget> _buildScreens() {
    return [ProfilePage(), ProfilePage()];
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.settings),
  //       title: ("Settings"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }
}
