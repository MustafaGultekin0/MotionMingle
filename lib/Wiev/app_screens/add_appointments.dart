import 'package:flutter/material.dart';
import 'package:motionminglee/components/color_content.dart';
import 'package:motionminglee/components/messages_contents/success_alert_message.dart';
import 'package:motionminglee/components/widget_contents/appbar_contents.dart';
import 'package:motionminglee/features/service/appointment_service.dart';

import '../../features/Models/appointments_model.dart';

class AddAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fizyoterapist Randevu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandevuForm(),
    );
  }
}

class RandevuForm extends StatefulWidget {
  @override
  _RandevuFormState createState() => _RandevuFormState();
}

class _RandevuFormState extends State<RandevuForm>{
  AppointmentService appointmentService = AppointmentService();
  AppBarContents appBarContents = AppBarContents();
  ColorContents colorContents = ColorContents();
  final TextEditingController _doktorAdiController = TextEditingController();
  final TextEditingController _notController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarContents.appbarBuildContainer(),
        title: const Text('Fizyoterapist Randevu'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _doktorAdiController,
                decoration: const InputDecoration(
                    labelText: 'Doktorun İsmi',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _notController,
                decoration: const InputDecoration(
                    labelText: 'Not',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Müsait Gün: \n${_selectedDate.toLocal()}'),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorContents.greenColor
                  ),
                  onPressed: () => _selectDate(context),
                  child: const Text('Tarih Seç'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Müsait Saat: ${_selectedTime.format(context)}'),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorContents.greenColor
                  ),
                  onPressed: () => _selectTime(context),
                  child: const Text('Saat Seç'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorContents.greenColor,
              ),
              onPressed: () async{
                // Randevu ekleme
                showSuccessDialog(context, 'Randevu Başarı ile eklendi.');
                AppointmentsModel newAppointment = AppointmentsModel(
                  doctor: _doktorAdiController.text,
                  note: _notController.text,
                  appointment_date: _selectedDate,
                );
                await appointmentService.addAppointment(newAppointment);
              },
              child: const Text('Randevu Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
