import 'package:flutter/material.dart';
import 'package:puppy/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puppy - PetPlatform',
      theme: ThemeData(
        primaryColor: Colors.blue[400],                
      ),
      home: AuthScreen(),
    );
  }
}
