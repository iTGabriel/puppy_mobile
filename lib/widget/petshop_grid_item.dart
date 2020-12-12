import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy/models/petshop.dart';
import 'package:puppy/utils/app_routes.dart';

class PetshopGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Petshop petshop = Provider.of(context, listen: false);

    return ClipRRect(
       borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(petshop.imageUrl, fit: BoxFit.cover),
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.PETSHOPS_DETAIL, arguments: petshop);
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(petshop.title, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
