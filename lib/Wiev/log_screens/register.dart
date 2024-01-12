import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motionminglee/Wiev/log_screens/loginPage.dart';
import 'package:motionminglee/components/widget_contents/my_textfield.dart';
import '../../components/messages_contents/alert_error_message.dart';
import '../../features/service/firebase_auth_sevice.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FireBaseAuthServices authServices = FireBaseAuthServices();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaydol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(_usernameController, 'Kullanıcı Adı', false),
            const SizedBox(height: 16.0),
            MyTextField(_emailController, 'eMail',false),
            const SizedBox(height: 16.0),
            MyTextField(_passwordController, 'Şifre', false),
            const SizedBox(height: 16.0),
            MyTextField(_confirmPasswordController, 'Şifre Tekrar', false),
            const SizedBox(height: 16.0),
            MyTextField(_titleController, 'Ünvan', true),
            const SizedBox(height: 16.0),
            MyTextField(_addressController, 'Şifre Tekrar', false),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                signUp();
              },
              child: const Text('Kaydol'),
            ),
          ],
        ),
      ),
    );
  }
  void signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await authServices.signUpEmailAndPassword(email, password);
    if(user != null){
      // ignore: use_build_context_synchronously
      showErrorDialog(context, 'Kullanıcı Kaydınız Başarıyla Tamamlandı');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPageDeneme()));
    }else{
      showErrorDialog(context, 'Kullanıcı Kaydınız Yapılamadı');
    }

}
}
