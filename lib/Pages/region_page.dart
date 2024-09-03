import 'package:flutter/material.dart';
import 'beach_detail_page.dart'; // Import the BeachDetailPage

class RegionPage extends StatelessWidget {
  final String regionName;
  final List<Map<String, String>> beaches;

  RegionPage({required this.regionName, required this.beaches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(regionName),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: beaches.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: BeachCard(
                imageUrl: beaches[index]['image']!, // Dynamic image for each beach
                beachName: beaches[index]['name']!, // Beach name
                description: 'Explore this beautiful beach', // Optional description
                onTap: () {
                  // Navigate to BeachDetailPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BeachDetailPage(
                        beachName: beaches[index]['name']!,
                        imageUrl: beaches[index]['image']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class BeachCard extends StatelessWidget {
  final String imageUrl;
  final String beachName;
  final String description;
  final VoidCallback onTap;

  BeachCard({
    required this.imageUrl,
    required this.beachName,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the onTap function when the card is tapped
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beachName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}