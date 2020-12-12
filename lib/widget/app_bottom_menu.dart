import 'package:flutter/material.dart';
import 'package:puppy/screens/petshops_overview_screen.dart';

class AppBottomNavigator extends StatefulWidget {
 
  @override
  _AppBottomNavigatorState createState() => _AppBottomNavigatorState();
}

class _AppBottomNavigatorState extends State<AppBottomNavigator> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    PetshopOverviewScreen(),
  ];

  void _changeScreen(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      onTap: (index) =>_changeScreen(index),
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cofigurações'),
      ],
      
    );
  }
}