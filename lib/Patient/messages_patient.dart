import 'package:flutter/material.dart';
import 'package:motionminglee/Wiev/app_screens/HomePage.dart';
import 'package:motionminglee/components/widget_contents/appbar_contents.dart';

class DoctorPatientScreen extends StatelessWidget {
  AppBarContents appBarContents = AppBarContents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.output), onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
        },
        ),
        flexibleSpace: appBarContents.appbarBuildContainer(),
        title: Text('İletişim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hasta Adı: Mustafa Gültekin',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Mesaj Konusu:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Mesaj Konusu Giriniz',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mesaj İçeriği:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Mesajınızı Giriniz',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Buraya mesaj gönderme işlevi eklenebilir
                },
                child: Text('Mesaj Gönder'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
