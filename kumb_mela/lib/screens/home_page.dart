import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/theme/padding.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Utility/constant.dart';
import '../theme/text_style.dart';
import '../utility/get_circle_avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://img.veenaworld.com/wp-content/uploads/2021/02/Maha-Kumbh-Mela-The-Largest-Religious-Gathering-on-Four-Sacred-Rivers.jpg',
    'https://img.veenaworld.com/wp-content/uploads/2021/02/Maha-Kumbh-Mela-The-Largest-Religious-Gathering-on-Four-Sacred-Rivers.jpg',
    'https://img.veenaworld.com/wp-content/uploads/2021/02/Maha-Kumbh-Mela-The-Largest-Religious-Gathering-on-Four-Sacred-Rivers.jpg',
  ];
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
          backgroundColor: kBlackColor,
          centerTitle: true,
          leading: Image.asset(
            Assets.icDrawerIcon,
            height: kSize(3),
            width: kSize(3),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Action for notification button
              },
            ),
            IconButton(
              icon: Icon(Icons.circle),
              onPressed: () {
                // Action for search button
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Action for search button
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Action for search button
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: CircleAvatar(
            //     child: Text('2'),
            //     backgroundColor: Colors.red,
            //     foregroundColor: Colors.white,
            //   ),
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                            child: Image.network(item,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
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
              ListTile(
                leading: Image.network(
                    'https://via.placeholder.com/600x400.png?text=Event+Image',
                    fit: BoxFit.cover),
                title: Text('Maha Aarti'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'In India, since ancient times, various forms of nature.....'),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16),
                        SizedBox(width: 4),
                        Text('07:00 am to 05:00 am Daily'),
                      ],
                    ),
                    Text('Ghat'),
                  ],
                ),
              ),
              // Repeat ListTile for other events
            ],
          ),
        ),
      ),
    );
  }
}
