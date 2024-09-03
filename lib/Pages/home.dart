import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import 'region_page.dart'; // Import the RegionPage

class HomePage extends StatelessWidget {
  final List<String> mapImages = [
    'assets/SouthIndianBeaches-Photoroom.png',
    'assets/WestIndianBeaches-Photoroom.png',
    'assets/EastIndianBeaches-Photoroom.png',
  ];

  final List<String> regionNames = [
    'Southern Coasts',
    'Western Coasts',
    'Eastern Coasts',
  ];

  // Dummy data for beaches and their images
  final Map<String, List<Map<String, String>>> beachesByRegion = {
    'Southern Coasts': [
      {'name': 'Marina Beach', 'image': 'assets/marina_beach.png'},
      {'name': 'Kovalam Beach', 'image': 'assets/kovalam_beach.png'},
      {'name': 'Varkala Beach', 'image': 'assets/varkala_beach.png'},
    ],
    'Western Coasts': [
      {'name': 'Goa Beach', 'image': 'assets/goa_beach.png'},
      {'name': 'Juhu Beach', 'image': 'assets/juhu_beach.png'},
      {'name': 'Versova Beach', 'image': 'assets/versova_beach.png'},
    ],
    'Eastern Coasts': [
      {'name': 'Puri Beach', 'image': 'assets/puri_beach.png'},
      {'name': 'Digha Beach', 'image': 'assets/digha_beach.png'},
      {'name': 'Gopalpur Beach', 'image': 'assets/gopalpur_beach.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your destination,',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search your destination',
                  prefixIcon: Icon(Icons.search, color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'or Choose a specific region!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to RegionPage with the relevant data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegionPage(
                              regionName: regionNames[index],
                              beaches: beachesByRegion[regionNames[index]]!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                mapImages[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                color: Colors.white.withOpacity(0.7),
                                child: Text(
                                  regionNames[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                    padding: EdgeInsets.only(bottom: 10),
                    indicatorBackgroundColor: Colors.grey,
                    currentIndicatorColor: Colors.orange,
                  ),
                  itemCount: mapImages.length,
                ),
              ),
              SizedBox(height: 20),
              // Add the Popular Beaches and Activities section here
              DefaultTabController(
                length: 2, // Two tabs: Popular Beaches and Activities
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      labelColor: Colors.orange,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.orange,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: [
                        Tab(text: 'Popular Beaches'),
                        Tab(text: 'Activities'),
                      ],
                      labelPadding: EdgeInsets.symmetric(horizontal: 40),
                      indicatorSize: TabBarIndicatorSize.label,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 200, // Adjust this height as needed
                      child: TabBarView(
                        children: [
                          buildTabContent('assets/popular_beach.png'),
                          buildTabContent('assets/activities_beach.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: Colors.grey),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Colors.grey),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget buildTabContent(String imagePath) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
