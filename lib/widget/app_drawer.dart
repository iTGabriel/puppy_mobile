import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(title: Text("Bem vindo usuário!")),
            Divider(),
            Image.asset(
              'assets/images/puppy_bluelogo.png',
              height: deviceSize.size.height * 0.16,
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
                padding: EdgeInsets.only(top: deviceSize.size.height * 0.010)),
            Divider(),
            ListTile(
              leading: Icon(Icons.home), // ICON/START/LEFT
              title: Text("Home"),
              onTap: () => {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline), // ICON/START/LEFT
              title: Text("Perfil"),
              onTap: () => {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings), // ICON/START/LEFT
              title: Text("Configurações"),
              onTap: () => {},
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
