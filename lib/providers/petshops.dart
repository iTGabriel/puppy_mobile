import 'package:flutter/foundation.dart';
import 'package:puppy/data/dummy_data.dart';
import 'package:puppy/models/petshop.dart';

class Petshops with ChangeNotifier {
  List<Petshop> _petshops = [...DUMMY_PETSHOPS];

  List<Petshop> get petshops => [..._petshops];

  int get petshoptsCount {
    return _petshops.length;
  }

  // Ainda a implementar carregamento de produtos
  Future<void> loadProducts() async{
    await null;
    return Future.value();
  }


}
