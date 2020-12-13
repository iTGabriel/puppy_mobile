import 'package:flutter/material.dart';
import 'package:puppy/models/petshop.dart';
import 'package:puppy/utils/app_routes.dart';

class PethopUserOrderTransport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final Petshop petshop = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Petshop - escolha de transporte'),
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
                Card(
                  elevation: 8.0,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceSize.size.height * 0.01)),
                      Text(
                        'Transporte',
                        style:
                            TextStyle(fontSize: deviceSize.size.height * 0.03),
                      ),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceSize.size.height * 0.01)),
                      Text('Escolha o metodo de transporte para o seu pet',
                          style: TextStyle(
                              fontSize: deviceSize.size.height * 0.022)),
                      Card(
                        child: ListTile(
                          // trailing: Text('R\$ 0',
                          //     style:
                          //         TextStyle(fontSize: deviceSize.size.height * 0.026)),
                          title: Text('Uber'),
                          subtitle: Text(
                              'Uma escolha para economia de tempo e segurança!'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          // trailing: Text('R\$ 0',
                          //     style:
                          //         TextStyle(fontSize: deviceSize.size.height * 0.026)),
                          title: Text('99'),
                          subtitle: Text(
                              'Uma escolha para economia de tempo e segurança!'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          // trailing: Text('R\$ 0',
                          //     style:
                          //         TextStyle(fontSize: deviceSize.size.height * 0.026)),
                          title: Text('Meu transporte / sem terceiros'),
                          subtitle: Text(
                              'Opção para quem quer levar o próprio pet ao veterinário!'),
                        ),
                      ),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceSize.size.height * 0.01)),
                      Text('Escolha a forma de pagamento',
                          style: TextStyle(
                              fontSize: deviceSize.size.height * 0.020)),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceSize.size.height * 0.01)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            elevation: 6.0,
                            splashColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceSize.size.width * 0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Theme.of(context).primaryColor,
                            onPressed: () => Navigator.of(context).pushNamed(
                                AppRoutes.PETSHOP_USER_ORDER_TRANSPORT_PAYMENT),
                            child: Text("Crédito",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: deviceSize.size.height * 0.020)),
                          ),
                          RaisedButton(
                            elevation: 6.0,
                            splashColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceSize.size.width * 0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Theme.of(context).primaryColor,
                            onPressed: () => null,
                            child: Text("Na retirada",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: deviceSize.size.height * 0.020)),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceSize.size.height * 0.01)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
