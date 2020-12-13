import 'package:flutter/material.dart';
import 'package:puppy/widget/cardpayment_form.dart';

class PetshopUserOrderCardPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puppy - pagamento'),
      ),
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 113, 188, 1),
              Color.fromRGBO(255, 255, 255, 0.8),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardPayment()
            ],
        ))
      ],
    ));
  }
}
