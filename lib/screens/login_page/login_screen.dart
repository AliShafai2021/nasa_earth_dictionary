import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/inpudecoration.dart';
import '../welcome_page/main_screen.dart';
import 'login_widget/button_widget.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5.0, -5.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  child:  Image.asset('assets/images/smallview.png'),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: mTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: mTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                const SizedBox(height: 15),

                Buttons(
                  title: 'Login',
                  color: Colors.indigo,
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()));
                          // Navigator.pushReplacementNamed(context, LandLord.id);

                    } catch (e) {
                      print(e);
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
