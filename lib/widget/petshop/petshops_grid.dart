import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy/providers/petshops.dart';
import 'package:puppy/widget/petshop/petshop_grid_item.dart';

class PetshopsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    Petshops petshopsProvider = Provider.of<Petshops>(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio:
            (deviceSize.size.width / 0.030) / (deviceSize.size.height / 0.1),
        crossAxisSpacing: 10,
        mainAxisSpacing: deviceSize.size.height * 0.03,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: petshopsProvider.petshoptsCount,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: petshopsProvider.petshops[i],
        child: PetshopGridItem(),
      ),
    );
  }
}
