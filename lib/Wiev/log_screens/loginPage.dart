import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:motionminglee/Wiev/log_screens/register.dart';
import 'package:motionminglee/components/widget_contents/bottom_navigation_bar.dart';
import '../../components/messages_contents/alert_error_message.dart';
import '../../features/service/firebase_auth_sevice.dart';

class LoginPageDeneme extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FireBaseAuthServices authServices = FireBaseAuthServices();

  @override
  Widget build(BuildContext context) {
    void SignIn()async{
      String email = emailController.text;
      String password = passwordController.text;

      User? user = await authServices.signInEmailAndPassword(email, password);
      if(user == null){
        // ignore: use_build_context_synchronously
        showErrorDialog(context, 'Kullanıcı adı veya şifre hatalıdır.');

      }else{
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNavigationBarOzel()));
      }
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange.shade900,
                  Colors.orange.shade800,
                  Colors.orange.shade400
                ]
            )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInUp(duration: const Duration(milliseconds: 1000), child: const Text("Motion Mingle", style: TextStyle(color: Colors.white, fontSize: 40),)),
                      const SizedBox(height: 10,),
                      FadeInUp(duration: const Duration(milliseconds: 1300), child: const Text("Hoşgeldiniz", style: TextStyle(color: Colors.white, fontSize: 18),)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 60,),
                      FadeInUp(duration: const Duration(milliseconds: 1400), child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(height: 40,),
                      FadeInUp(duration: const Duration(milliseconds: 1500),
                          child: const Text("Şifrenizi Unuttunuz mu?", style: TextStyle(color: Colors.grey),)),
                      const SizedBox(height: 10,),
                      FadeInUp(duration: const Duration(milliseconds: 1500),
                          child: InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                            },
                            child: Text("Kaydol", style: TextStyle(color: Colors.grey),))),
                      const SizedBox(height: 40,),
                      FadeInUp(duration: const Duration(milliseconds: 1600),
                          child: MaterialButton(
                        onPressed: () {
                          SignIn();
                        },
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        color: Colors.orange[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        // decoration: BoxDecoration(
                        // ),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),
                      const SizedBox(height: 50,),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: SizedBox(
                            width: 150,
                            height: 80,
                            child: Image.asset("assets/images/logo2.png")
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}