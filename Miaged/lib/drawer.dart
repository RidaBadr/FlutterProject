import 'package:flutter/material.dart';

import 'AboutEtFAQ/aboutApp.dart';
import 'AboutEtFAQ/faq.dart';
import 'Authentification/login_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Logout AlertDialog Start Here
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text(
              "Confirmer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text("Êtes-vous sûr de vouloir vous déconnecter?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: const Text(
                  "Fermer",
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              TextButton(
                child: const Text(
                  "Se Déconnecter",
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
              ),
            ],
          );
        },
      );
    }
    // Logout AlertDialog Ends Here

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.teal,
                image: DecorationImage(
                  image:
                      NetworkImage('https://i.postimg.cc/nLnC8FSD/MIAGED.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaqPage()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'A propos',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutApp()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'Se Déconnecter',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
                _showDialog();
              },
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
