class AppointmentsModel{
  String? documentId;
  String? doctor;
  String? note;
  DateTime? appointment_date;

  AppointmentsModel({
    this.documentId,
    required this.doctor,
    required this.note,
    this.appointment_date
  });
  Map<String, dynamic> toJson() {
    return {
      'doctor': doctor,
      'note': note,
      'appointment_date': appointment_date,
    };
  }
}