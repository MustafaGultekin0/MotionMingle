import 'package:flutter/material.dart';
import 'package:motionminglee/Patient/WievPatient/iconButtonPages/messages.dart';
import 'package:motionminglee/Patient/messages_patient.dart';
import 'package:motionminglee/Wiev/app_screens/HomePage.dart';
import 'package:motionminglee/Wiev/app_screens/add_appointments.dart';
import 'package:motionminglee/Wiev/app_screens/my_appointments.dart';
import 'package:motionminglee/Wiev/Chat/chat_screen.dart';
import 'package:motionminglee/components/color_content.dart';

class BottomNavigationBarOzel extends StatefulWidget {
  const BottomNavigationBarOzel({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarOzel> createState() => _BirBottomNavigationBarOzelState();
}

class _BirBottomNavigationBarOzelState extends State<BottomNavigationBarOzel> {
  ColorContents colorContents = ColorContents();
  int _secilenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorContents.orangeColor,
        onDestinationSelected: (int index) {
          setState(() {
            _secilenIndex = index;
          });
        },
        indicatorColor: ColorContents.greenColor,
        selectedIndex: _secilenIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'AnaSayfa',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_repair_service),
            label: 'Randevu Ekle',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Randevular',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Mesaj Gönder',
          ),
        ],
      ),
      body: <Widget>[
        HomePage(),
        AddAppointments(),
        AppointmentListPage(),
        const ChatScreen()
      ][_secilenIndex],
    );
  }
}
