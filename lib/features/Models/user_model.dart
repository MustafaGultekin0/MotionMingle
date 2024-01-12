class UserModal{
  String? name;
  String? surname;
  String? username;
  String? email;
  String? password;
  String? mobilePhone;

  UserModal({
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    required this.password,
    required this.mobilePhone
});
  Map<String, dynamic> toJson() {
    return {
      'ad': name,
      'soyad': surname,
      'kullaniciAdi': username,
      'email': email,
      'sifre': password,
      'telefon': mobilePhone,
    };
  }
}