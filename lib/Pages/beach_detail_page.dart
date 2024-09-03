import 'package:flutter/material.dart';

class BeachDetailPage extends StatelessWidget {
  final String beachName;
  final String imageUrl;

  BeachDetailPage({required this.beachName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beachName),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beachName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is a beautiful beach located in [Location]. It is known for its clean sands, clear waters, and a variety of activities such as swimming, sunbathing, and beach sports.',
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add more details here as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}