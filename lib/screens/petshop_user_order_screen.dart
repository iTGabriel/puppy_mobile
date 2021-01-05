import 'package:flutter/material.dart';
import 'package:puppy/models/petshop.dart';
import 'package:puppy/utils/app_routes.dart';

class PetshopUserOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    List petinfoAndServicesContracted =
        ModalRoute.of(context).settings.arguments;
    Petshop petshop = petinfoAndServicesContracted[0];

    List<Map> servicesContracted = petinfoAndServicesContracted[1];

    return Scaffold(
      appBar: AppBar(
        title: Text('Petshop - confirmar pedido'),
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
                        'Confirmação de pedido',
                        style:
                            TextStyle(fontSize: deviceSize.size.height * 0.03),
                      ),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceSize.size.height * 0.01)),
                      Container(
                        height: deviceSize.size.height * 0.3,
                        width: double.infinity,
                        child:
                            Image.network(petshop.imageUrl, fit: BoxFit.cover),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceSize.size.height * 0.01)),
                      Divider(),
                      Text('Serviços solicitados',
                          style: TextStyle(
                              fontSize: deviceSize.size.height * 0.03)),
                      ...servicesContracted.map((servico) => Card(
                            child: ListTile(
                              trailing: Text(
                                  'R\$ ${servico.values.toString().replaceAll(new RegExp(r'[(\)]'), '')}',
                                  style: TextStyle(
                                      fontSize:
                                          deviceSize.size.height * 0.026)),
                              title: Text(
                                  '${servico.keys.toString().replaceAll(new RegExp(r'[(\)]'), '')}'),
                              subtitle: Text('Descrição do serviço'),
                            ),
                          )),
                      Divider(),
                      RaisedButton(
                        elevation: 6.0,
                        splashColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceSize.size.width * 0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => Navigator.of(context).pushNamed(
                            AppRoutes.PETSHOP_USER_ORDER_TRANSPORT,
                            arguments: petshop),
                        child: Text("Confirmar",
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
