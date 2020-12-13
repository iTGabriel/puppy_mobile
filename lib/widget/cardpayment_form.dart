import 'package:flutter/material.dart';
import 'package:puppy/utils/app_routes.dart';

class CardPayment extends StatefulWidget {
  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  GlobalKey<FormState> _form = GlobalKey();

  String _dataValue = '';

  Future<void> _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        locale: const Locale("pt"),
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null)
      setState(() {
        final pickedSplit = picked.toString().split(" ");
        final pickedData = pickedSplit[0].trim().split("-");
        final validData = "${pickedData[2]}/${pickedData[1]}/${pickedData[0]}";

        _dataValue = validData;
      });
  }

  Future<void> _toPay() async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Pagamento realizado'),
        content: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            child: Column(
              children: [
                Text(
                    'O pagamento foi realizado, seu pepdido foi enviado ao petshop!'),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015)),
                Icon(
                  Icons.verified,
                  size: MediaQuery.of(context).size.height * 0.15,
                )
              ],
            )),
        actions: <Widget>[
          FlatButton(
            child: Text('Fechar'),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.PETSHOPS),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);

    return Card(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(top: deviceSize.size.height * 0.025)),
                Text('Pagamento',
                    style: TextStyle(
                      fontSize: deviceSize.size.width * 0.055,
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(top: deviceSize.size.height * 0.025)),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.all(deviceSize.size.height * 0.010),
                      labelText: 'Número do cartão de crédito',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor))),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: deviceSize.size.height * 0.012)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: deviceSize.size.width * 0.15,
                          child: FlatButton(
                            onPressed: _selectDate,
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        Text(
                          _dataValue == ''
                              ? 'Selecione a data de validade'
                              : 'Validade do cartao: ${_dataValue}',
                          style: TextStyle(
                              fontSize: deviceSize.size.height * 0.016,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: deviceSize.size.width * 0.25,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: deviceSize.size.height * 0.001),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(
                                deviceSize.size.height * 0.010,
                              ),
                              labelText: 'CVV',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor))),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: deviceSize.size.height * 0.035)),
                RaisedButton(
                  elevation: 6.0,
                  splashColor: Colors.black,
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceSize.size.width * 0.1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _toPay();
                  },
                  child: Text("Efetuar pagamento",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: deviceSize.size.height * 0.020)),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: deviceSize.size.height * 0.025)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
