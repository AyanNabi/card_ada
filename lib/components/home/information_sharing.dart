import 'package:flutter/material.dart';

import 'information_card.dart';

class InformationSharing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Məlumat paylaşımı',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        InformationCard(
          icon: Icons.list,
          title: 'Sorğulanmış məlumatlarım',
          subtitle: 'Qurumlar tərəfindən sorğulanan',
        ),
        SizedBox(height: 16),
        InformationCard(
          icon: Icons.share,
          title: 'Paylaşdığım məlumatlarım',
          subtitle: 'QR kod və PDF fayl ilə paylaşılan',
        ),
      ],
    );
  }
}