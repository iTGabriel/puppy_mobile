import 'package:flutter/material.dart';
import 'package:puppy/models/petshop.dart';

class PetshopUserOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final Petshop petshop = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Petshop - confirmar pedido'),
      ),
      body: SingleChildScrollView(
        child: Card(
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
              // Container(
              //   height: deviceSize.size.height * 0.3,
              //   width: double.infinity,
              //   child: Image.network(petshop.imageUrl, fit: BoxFit.cover),
              // ),
              // Padding(
              //     padding: EdgeInsets.symmetric(
              //         vertical: deviceSize.size.height * 0.01)),
              // Divider(),
              Text('Serviços solicitados',
                  style: TextStyle(fontSize: deviceSize.size.height * 0.03)),
              ListTile(
                trailing: Text('R\$ 0',
                    style: TextStyle(fontSize: deviceSize.size.height * 0.026)),
                title: Text('servico'),
                subtitle: Text('Descrição do serviço'),
              ),
              ListTile(
                trailing: Text('Total: R\$ 0',
                    style: TextStyle(fontSize: deviceSize.size.height * 0.026)),
              ),
              Divider(),
              RaisedButton(
                elevation: 6.0,
                splashColor: Colors.black,
                padding: EdgeInsets.symmetric(
                    horizontal: deviceSize.size.width * 0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).primaryColor,
                onPressed: () => null,
                child: Text("Confirmar", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
