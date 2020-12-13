import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puppy/utils/app_routes.dart';

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
    final deviceSize = MediaQuery.of(context);
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
        width: deviceSize.size.width * 0.75,
        height: !_invalidaForm
            ? (_authMode == AuthMode.Login
                ? deviceSize.size.height * 0.70 // Login without failed submit
                : deviceSize.size.height *
                    0.75) // Register without failed submit
            : (_authMode == AuthMode.Login
                ? deviceSize.size.height * 0.75 // Login with failed submit
                : deviceSize.size.height *
                    0.80), // Register without failed submit
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: deviceSize.viewInsets.bottom * 0.40),
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceSize.size.height * 0.25,
                      child: Image.asset('assets/images/puppy_bluelogo.png'),
                    ),
                    Text(
                      'PUPPY',
                      style: TextStyle(
                          fontSize: deviceSize.size.width * 0.055,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '- Uma plataforma para os cuidados do seu pet -',
                      style: TextStyle(
                          fontSize: deviceSize.size.width * 0.030,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorLight),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: deviceSize.size.height * 0.025)),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.all(deviceSize.size.height * 0.010),
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          )),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return "Informe um e-mail valido!";
                        }
                        return null;
                      },
                      onSaved: (value) => _authData['email'] = value,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: deviceSize.size.height * 0.015)),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.all(deviceSize.size.height * 0.010),
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
                        return null;
                      },
                      onSaved: (value) => _authData['password'] = value,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    if (_authMode == AuthMode.Signup)
                      FadeTransition(
                        opacity: _animationController,
                        child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                    deviceSize.size.height * 0.010),
                                labelText: 'Confirme a senha',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColor))),
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
                    Padding(
                        padding: EdgeInsets.only(
                            top: deviceSize.size.height * 0.025)),
                    RaisedButton(
                      elevation: 6.0,
                      splashColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceSize.size.width * 0.1),
                      // onPressed: _submit,
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.PETSHOPS),
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
      ),
    );
  }
}
