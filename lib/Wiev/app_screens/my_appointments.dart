import 'package:flutter/material.dart';
import 'package:motionminglee/components/widget_contents/appbar_contents.dart';
import 'package:motionminglee/features/Models/appointments_model.dart';
import 'package:motionminglee/features/service/appointment_service.dart';

class AppointmentsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppointmentListPage(),
    );
  }
}

class AppointmentListPage extends StatefulWidget {
  @override
  _AppointmentListPageState createState() => _AppointmentListPageState();
}

class _AppointmentListPageState extends State<AppointmentListPage> {
  final AppointmentService _appointmentService = AppointmentService();

  Future<void> _showDeleteConfirmationDialog(BuildContext context, AppointmentsModel appointment) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Appointment'),
          content: Text('Are you sure you want to delete this appointment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                //await _appointmentService.deleteAppointment(_appointmentService.documentId);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }


  AppBarContents appBarContents = AppBarContents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarContents.appbarBuildContainer(),
        title: Text('Randevu Listesi'),
      ),
      body: StreamBuilder<List<AppointmentsModel>>(
        stream: _appointmentService.getAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata oluştu: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('Hiç randevu bulunamadı.');
          } else {
            List<AppointmentsModel> appointments = snapshot.data!;
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                AppointmentsModel appointment = appointments[index];
                return ListTile(
                  title: Text(appointment.doctor ?? ''),
                  subtitle: Text(appointment.note ?? ''),
                  trailing: Text(appointment.appointment_date?.toString() ?? ''),
                  leading: IconButton(
                    onPressed: () {
                        //_appointmentService.deleteAppointment());
                    }, icon: Icon(Icons.delete),

                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
