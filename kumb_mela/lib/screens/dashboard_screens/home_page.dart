import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/screens/profile_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../Utility/constant.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';
import '../../utility/get_circle_avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _screens() {
    return [
      HomePage(),
      HomePage(),
      HomePage(),
    ];
  }

  // PersistentTabView _buildScreens(context) {
  //   return PersistentTabView(
  //     context,
  //     controller: _controller,
  //     tabs: [],
  //     navBarBuilder: (NavBarConfig) {},
  //   );
  // }

  final List<String> imgList = [
    'https://img.veenaworld.com/wp-content/uploads/2021/02/Maha-Kumbh-Mela-The-Largest-Religious-Gathering-on-Four-Sacred-Rivers.jpg',
    'https://img.veenaworld.com/wp-content/uploads/2021/02/Maha-Kumbh-Mela-The-Largest-Religious-Gathering-on-Four-Sacred-Rivers.jpg',
    'https://img.veenaworld.com/wp-content/uploads/2021/02/Maha-Kumbh-Mela-The-Largest-Religious-Gathering-on-Four-Sacred-Rivers.jpg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        // bottomNavigationBar: PersistentTabBar(
        //   controller: _controller,
        //   items: _navBarItems(),
        //   backgroundColor: Colors.white,
        //   hideNavigationBarWhenKeyboardShows: true,
        //   popAllScreensOnTapOfSelectedTab: true,
        //   navBarStyle: NavBarStyle.style9,
        // ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    kSizedBox(height: 2),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: imgList
                          .map((item) => Center(
                                child: Image.network(item, fit: BoxFit.cover, width: 1000),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Events',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Kumbh Attraction',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: kEdgeInsetsAll(2),
                      child: Container(
                        // margin: kEdgeInsetsAll(2),
                        padding: kEdgeInsetsAll(2),
                        decoration: kBoxDecoration(color: kGreyColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.icAartiMessage,
                              width: kSize(12),
                              height: kSize(12),
                            ),
                            kSizedBox(width: 2),
                            Expanded(
                              child: Padding(
                                padding: kEdgeInsetsAll(2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Maha Aarti',
                                      style: kBold2BlackTextStyle().apply(color: kWhiteColor),
                                    ),
                                    Text(
                                      'In India, since ancient times, various forms of nature.....',
                                      style: kMedium1BlackTextStyle().apply(color: kGreyColor10),
                                    ),
                                    kSizedBox(height: 2),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: kGreyColor10,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '07:00 am to 05:00 am Daily',
                                          style: kSemiBold0BlackTextStyle().apply(color: kGreyColor10),
                                        ),
                                      ],
                                    ),
                                    kSizedBox(height: 2),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_sharp,
                                          size: 16,
                                          color: kGreyColor10,
                                        ),
                                        Text(
                                          'Ghat',
                                          style: kSemiBold0BlackTextStyle().apply(color: kGreyColor10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )

                    // Repeat ListTile for other events
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
