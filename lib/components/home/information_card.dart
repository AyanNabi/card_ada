
import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  InformationCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.grey),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(subtitle, style: TextStyle(fontSize: 8, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
