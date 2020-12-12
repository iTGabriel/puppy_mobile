import 'package:flutter/material.dart';
import 'package:puppy/widget/auth_form.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        // leading: Image.asset('assets/images/puppy_bluelogo.png'),
        title: Text('Puppy - Uma plataforma para pets'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 113, 188, 1),
                Color.fromRGBO(255, 255, 255, 0.8),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [AuthCard()],
            ),
          )
        ],
      ),
    );
  }
}
