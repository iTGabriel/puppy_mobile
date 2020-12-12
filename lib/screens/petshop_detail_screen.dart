import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:puppy/models/petshop.dart';

class PetshopDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final Petshop petshop = ModalRoute.of(context).settings.arguments;
    print(petshop.services);
    return Scaffold(
      appBar: AppBar(
        title: Text('Petshop - infos'),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 8.0,
          child: Column(
            children: [
              // SizedBox(height: deviceSize.size.height * 0.03),
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
              Text('Serviços',
                  style: TextStyle(fontSize: deviceSize.size.height * 0.03)),
            ],
          ),
        ),
      ),
    );
  }
}
