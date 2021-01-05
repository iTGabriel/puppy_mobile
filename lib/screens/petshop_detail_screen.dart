import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:puppy/models/petshop.dart';
import 'package:puppy/utils/app_routes.dart';
import 'package:puppy/widget/petshop/petshop_detail_card.dart';

class PetshopDetailScreen extends StatefulWidget {
  @override
  _PetshopDetailScreenState createState() => _PetshopDetailScreenState();
}

class _PetshopDetailScreenState extends State<PetshopDetailScreen> {
  Map services = {};
  // Servicos(nameService) : value

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final Petshop petshop = ModalRoute.of(context).settings.arguments;
    final petshopServicos = petshop.services;

    // IMPLEMENTANDO
    void _serviceSelected(String servico, double preco) {
      if (!services.containsKey(servico)) {
        services[servico] = preco;
      } else {
        services.remove(servico);
      }
      setState(() {});
      print(services);
    }

    bool _verifyServices(String servico) {
      return services.containsKey(servico);
    }

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Petshop - infos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceSize.size.height * 0.3,
              width: double.infinity,
              child: Image.network(petshop.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: deviceSize.size.height * 0.01)),
            Divider(),
            Text(
              'Petshop',
              style: TextStyle(fontSize: deviceSize.size.height * 0.02),
            ),
            Text(
              petshop.title,
              style: TextStyle(fontSize: deviceSize.size.height * 0.02),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: deviceSize.size.height * 0.01)),
            Text(petshop.description),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: deviceSize.size.height * 0.01)),
            Divider(),
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              ),
              itemCount: petshop.photografies.length,
              itemBuilder: (BuildContext context, int itemIndex) => Container(
                  width: deviceSize.size.width * 0.7,
                  // height: deviceSize.size.height * 0.8,
                  child: Image.network(petshop.photografies[itemIndex])),
            ),
            Divider(),
            Text('Nossos serviços',
                style: TextStyle(fontSize: deviceSize.size.height * 0.03)),
            ...petshopServicos.map((servicoData) => GestureDetector(
                child: Card(
                  color: _verifyServices(servicoData['servico'])
                      ? Theme.of(context).primaryColor
                      : null,
                  child: ListTile(
                    trailing: Text('R\$${servicoData['preco']}0',
                        style: TextStyle(
                            fontSize: deviceSize.size.height * 0.026,
                            color: _verifyServices(servicoData['servico'])
                                ? Colors.white
                                : Colors.black)),
                    title: Text(servicoData['servico'],
                        style: TextStyle(
                            color: _verifyServices(servicoData['servico'])
                                ? Colors.white
                                : Colors.black)),
                    subtitle: Text('Descrição do serviço',
                        style: TextStyle(
                            color: _verifyServices(servicoData['servico'])
                                ? Colors.white
                                : null)),
                  ),
                ),
                onTap: () {
                  _serviceSelected(
                      servicoData['servico'], servicoData['preco']);
                })),
            Divider(),
            RaisedButton(
              elevation: 6.0,
              splashColor: Colors.black,
              padding:
                  EdgeInsets.symmetric(horizontal: deviceSize.size.width * 0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Theme.of(context).primaryColor,
              onPressed: () => Navigator.of(context)
                  .pushNamed(AppRoutes.PETSHOP_USER_ORDER, arguments: [
                petshop,
                [services]
              ]),
              child: Text("Contratar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: deviceSize.size.height * 0.020)),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: deviceSize.size.height * 0.01)),
          ],
        ),
      ),
    );
  }
}
