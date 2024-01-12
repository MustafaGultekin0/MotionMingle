import 'package:flutter/material.dart';
import 'package:motionminglee/Wiev/app_screens/HomePage.dart';
import 'package:motionminglee/components/widget_contents/bottom_navigation_bar.dart';

void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Başarılı'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('Kapat'),
            onPressed: () {
              Navigator.of(context).pop(); // AlertDialog'ı kapat
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNavigationBarOzel()));
          }, child: Text('Anasayfaya Dön'))
        ],
      );
    },
  );
}
