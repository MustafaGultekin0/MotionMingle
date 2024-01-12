import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motionminglee/features/Models/appointments_model.dart';

class AppointmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'Appointments';

  Future<void> addAppointment(AppointmentsModel appointment) async {
    try {
      await _firestore.collection(_collectionName).add(appointment.toJson());
    } catch (e) {
      print('Hata: $e');
    }
  }

  Future<void> deleteAppointment(String documentId) async {
    try {
      await _firestore.collection(_collectionName).doc(documentId).delete();
    } catch (e) {
      print('Hata: $e');
    }
  }

  Future<void> updateAppointment(String documentId, AppointmentsModel newAppointment) async {
    try {
      await _firestore.collection(_collectionName).doc(documentId).update(newAppointment.toJson());
    } catch (e) {
      print('Hata: $e');
    }
  }

  Stream<List<AppointmentsModel>> getAppointments() {
    try {
      return _firestore.collection(_collectionName).snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => AppointmentsModel(
          doctor: doc['doctor'],
          note: doc['note'],
          appointment_date: (doc['appointment_date'] as Timestamp?)?.toDate(),
        )
        ).toList();
      });
    } catch (e) {
      print('Hata: $e');
      return Stream.value([]);
    }
  }

}