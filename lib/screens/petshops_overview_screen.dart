import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy/providers/petshops.dart';
import 'package:puppy/widget/app_bottom_menu.dart';
import 'package:puppy/widget/app_drawer.dart';
import 'package:puppy/widget/petshop/petshops_grid.dart';

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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
            // onPressed: () {
            //   // Implementar a classe Search com herança de SearchDelegate para realização de buscas.
            //   showSearch(context: context, delegate: null);
            // },
          )
        ],
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
