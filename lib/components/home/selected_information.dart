
import 'package:flutter/material.dart';

class SelectedInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seçdiyim məlumatlarım',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(Icons.add, size: 40, color: Colors.blue),
              SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Çox istifadə etdiyiniz məlumatları seçin.', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Seçilən məlumatların sayı ən çox 3 ola bilər.', style: TextStyle(fontSize: 9, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
