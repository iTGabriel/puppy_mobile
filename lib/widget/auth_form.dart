import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _form = GlobalKey();
  final Map<String, String> _authData = {'email': '', 'password': ''};
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();
  bool _invalidaForm = false;
  AnimationController _animationController;
  Animation<double> _opacityAnimation;

  initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _animationController.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _animationController.reverse();
    }
  }

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      _invalidaForm = true;
      return;
    }
    _invalidaForm = false;
  }

  @override
  Widget build(BuildContext context) {
    final device_size = MediaQuery.of(context);
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
        width: device_size.size.width * 0.75,
        height: !_invalidaForm
            ? (_authMode == AuthMode.Login
                ? device_size.size.height * 0.68
                : device_size.size.height * 0.70)
            : (_authMode == AuthMode.Login
                ? device_size.size.height * 0.75
                : device_size.size.height * 0.77),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: device_size.viewInsets.bottom * 0.30),
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: Image.asset('assets/images/puppy_bluelogo.png'),
                  ),
                  Text(
                    'PUPPY',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- Sua plataforma quando pensa no seu pet -',
                    style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorLight),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Informa um e-mail valido';
                      }
                    },
                    onSaved: (value) => null,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return "Informe uma senha maior que 5 caracteres";
                      }
                    },
                    onSaved: (value) => null,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  // if (_authMode == AuthMode.Signup)
                    FadeTransition(
                      opacity: _animationController,
                                          child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Confirme a senha',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor))),
                          obscureText: true,
                          validator: _authMode == AuthMode.Signup
                              ? (value) {
                                  if (value != _passwordController.text) {
                                    return "Senha são diferentes!";
                                  }
                                  return null;
                                }
                              : null),
                    ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    onPressed: _submit,
                    child: Text(
                        " ${_authMode == AuthMode.Login ? 'Entrar' : 'Cadastrar'}",
                        style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      onPressed: _switchAuthMode,
                      child: Text(
                          "ALTERNAR P/ ${_authMode == AuthMode.Login ? 'REGISTRAR' : 'LOGIN'}"),
                      textColor: Theme.of(context).primaryColor)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
