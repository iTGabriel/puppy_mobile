import 'package:flutter/material.dart';
import 'package:puppy/widget/petshop/payment_sucess.dart';

class PetshopUserOrderPaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Puppy - Uma plataforma para pets"),
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
              PaymentSucess()


            ],
          ))
        ],
      ),
    );
  }
}
