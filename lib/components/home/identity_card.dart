
import 'package:flutter/material.dart';

import '../../utils/nfc_service.dart';

class IdentityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth * 0.9;
        double cardHeight = cardWidth * 0.6; // Slightly adjusting height to match proportions
        double imageWidth = cardWidth * 0.25;
        double imageHeight = cardHeight * 0.65;

        return Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              // ADA University Logo and Text
              Positioned(
                top: 8,
                left: 16,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/ada_logo.png', // Replace with actual logo asset
                      height: cardHeight * 0.2,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'ADA UNIVERSITY',
                      style: TextStyle(
                        fontSize: cardWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              // Student Image
              Positioned(
                top: cardHeight * 0.25,
                left: 16,
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://example.com/path/to/student_image.jpg', // Replace with actual image URL or asset
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Name and Status
              Positioned(
                top: cardHeight * 0.25,
                left: cardWidth * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color:Color(0xFF92201E),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Text(
                        'Ayan Nabizada',
                        style: TextStyle(
                          fontSize: cardWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xFF272850),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      margin: EdgeInsets.zero,
                      child: Text(
                        'STUDENT',
                        style: TextStyle(
                          fontSize: cardWidth * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ID
              Positioned(
                bottom: 16,
                right: 16,
                child: Text(
                  'ID: P000019784',
                  style: TextStyle(
                    fontSize: cardWidth * 0.05,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
              // Wi-Fi Icon
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent, // Ensures tap events are registered
                  onTap: () {
                    print("WiFi button clicked");
                    NfcService.startNFCReading(); // Replace "Your data to write" with the actual data
                  },
                  child: Icon(
                    Icons.wifi,
                    color: Colors.blue.shade900,
                    size: cardWidth * 0.08,
                  ),
                ),
              ),



            ],
          ),
        );
      },
    );
  }
}
