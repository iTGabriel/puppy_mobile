import 'package:flutter/material.dart';

class PetshopDetailWidget extends StatelessWidget {
  final Map petshopServices;

  PetshopDetailWidget(this.petshopServices);

  @override
  Widget build(BuildContext context) {
    print(petshopServices);

    return Container(
      child: Card(
        child: ListTile(
          leading: petshopServices['servico'],
          // title: value,
        ),
      ),
    );
  }
}
