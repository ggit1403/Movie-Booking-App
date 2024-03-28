import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:movie_booking_app/controllers/shared_pref.dart';
import 'package:movie_booking_app/pages/profile_screen.dart';
import 'package:movie_booking_app/pages/select_location_screen.dart';
import 'package:movie_booking_app/utils/custom_slider.dart';
import 'package:movie_booking_app/utils/dummy_data.dart';
import 'package:movie_booking_app/utils/event_items.dart';
import 'package:movie_booking_app/utils/menu_item.dart';
import 'package:movie_booking_app/utils/movies_item.dart';
import 'package:movie_booking_app/utils/mytheme.dart';

import '../controllers/auth_controller.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];
  final Completer<GoogleMapController> _controller = Completer();
  bool _showChatbot = false;

  @override
  void initState() {
    SharedPref.getLocation()
        .then((value) => LocationController.instance.setCity(value));
    super.initState();
  }

  void toggleChatbot() {
    setState(() {
      _showChatbot = !_showChatbot;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ProfileScreen());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: AuthController.instance.user!.photoURL ??
                        Constants.dummyAvatar,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AuthController.instance.user!.displayName ?? "Duong",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SelectionLocationScreen());
                    },
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            LocationController.instance.city.value,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                inherit: true,
                                fontSize: 14),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down,
                            color: Colors.white.withOpacity(0.7)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                ),
              ),
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.2,
                      width: size.width,
                      color: Colors.red,
                      child: PageView.builder(
                        itemCount: 3,
                        itemBuilder: (_, i) {
                          return CustomSlider(
                            index: i,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        "SEAT CATEGORIES",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    const MyMenuItem(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Text(
                        "RECOMMENDED SEATS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    const MoviesItems(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/spotlights.svg",
                            color: Colors.black.withOpacity(0.8),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Hoạt hình".toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View All",
                              style: TextStyle(color: Mytheme.splash),
                            ),
                          ),
                        ],
                      ),
                    ),
                    EventItems(
                      events: events,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/theater_masks.svg",
                            color: Colors.black.withOpacity(0.8),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Drama".toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View All",
                              style: TextStyle(color: Mytheme.splash),
                            ),
                          ),
                        ],
                      ),
                    ),
                    EventItems(
                      events: plays,
                    ),
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
