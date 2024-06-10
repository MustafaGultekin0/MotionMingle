import 'package:flutter/material.dart';
import 'package:motionminglee/components/buttons/IconButton.dart';
import 'package:motionminglee/components/color_content.dart';
import 'package:motionminglee/components/widget_contents/appbar_contents.dart';
import 'package:motionminglee/features/service/firebase_auth_sevice.dart';
import 'package:motionminglee/features/service/user_service.dart';
import 'package:motionminglee/Wiev/log_screens/loginPage.dart';


class HomePagePatient extends StatelessWidget {
  HomePagePatient({Key? key}) : super(key: key);
  AppBarContents appBarContents = AppBarContents();
  FireBaseAuthServices authServices = FireBaseAuthServices();
  UserService _userService = UserService();
  ColorContents colorContents = ColorContents();

  IconButtons iconButtons = IconButtons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarContents.appbarBuildContainer(),
        leading: IconButton(
          icon: Icon(Icons.output), onPressed: () {
            authServices.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPageDeneme()));
        },
        ),
        title: const Text('Anasayfa'),
        actions: [
          iconButtons.buildIconButton(Icon(Icons.chat)),
          iconButtons.buildIconButton(Icon(Icons.calendar_today)),
          iconButtons.buildIconButton(Icon(Icons.contact_mail)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Doktor Ara',
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: ColorContents.greenColor,
              child: const Text(
                'Hekim aradığınız şehri seçin',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'En Çok Tercih Edilen Doktorlar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // En çok gidilen doktor sayısı
                itemBuilder: (context, index) {
                  return DoctorCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(

        ),
        title: Text('Dr. İsim Soyisim'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ünvanı: Uzman Doktor'),
            Text('Bulunduğu İl: İstanbul'),
            Text('Klinik Adresi: Örnek Klinik, Örnek Cadde No: 123'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Müsait Zamanlar'),
            Text('Salı 14:00 - 16:00'),
            Text('Perşembe 10:00 - 12:00'),
            // Burada doktorun müsait olduğu gün ve saatleri gösterebilirsiniz
          ],
        ),
      ),
    );
  }
}
