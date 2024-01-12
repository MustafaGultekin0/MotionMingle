import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motionminglee/features/Models/user_model.dart';
class UserService {
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(UserModal user) async {
    try {
      await _usersCollection.add(user.toJson());
      print('User added to Firestore');
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _usersCollection.doc(userId).delete();
      print('User deleted from Firestore');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  Stream<List<UserModal>> getUsers() {
    return _usersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModal(
          name: doc['ad'],
          surname: doc['soyad'],
          username: doc['kullaniciAdi'],
          email: doc['email'],
          password: doc['sifre'],
          mobilePhone: doc['telefon'],
        );
      }).toList();
    });
  }
}
