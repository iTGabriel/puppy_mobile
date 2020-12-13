import 'package:flutter/material.dart';
import 'package:puppy/models/petshop.dart';

class PaymentSucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final Petshop petshop = ModalRoute.of(context).settings.arguments;

    return Card(
      elevation: 8.0,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: deviceSize.size.height * 0.01)),
          Text(
            'Confirmação de pedido',
            style: TextStyle(fontSize: deviceSize.size.height * 0.03),
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: deviceSize.size.height * 0.01)),
        ],
      ),
    );
  }
}
