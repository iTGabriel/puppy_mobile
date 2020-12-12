import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy/providers/petshops.dart';
import 'package:puppy/widget/app_bottom_menu.dart';
import 'package:puppy/widget/app_drawer.dart';
import 'package:puppy/widget/petshops_grid.dart';

class PetshopOverviewScreen extends StatefulWidget {
  @override
  _PetshopOverviewScreenState createState() => _PetshopOverviewScreenState();
}

class _PetshopOverviewScreenState extends State<PetshopOverviewScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Provider.of<Petshops>(context, listen: false).loadProducts().then((_) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final deviceSize = Mediaqu
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          'Petshops',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: PetshopsGrid(),
      bottomNavigationBar: AppBottomNavigator(),
    );
  }
}
