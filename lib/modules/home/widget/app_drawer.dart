import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("CTI Sistemas"),
            accountEmail: Text("suporte@ctisistemas.com.br"),
            currentAccountPicture: CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  AssetImage("assets/images/logotransparentecti.png"),
            ),
          ),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Account"),
              subtitle: Text("My account..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text("Orderd"),
              subtitle: Text("Purchases made..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.star),
              title: Text("Favorite"),
              subtitle: Text("My favorite..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign out"),
              subtitle: Text("Exit the application"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
