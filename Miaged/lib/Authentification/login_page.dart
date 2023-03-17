import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miaged/Home.dart';
import 'RegisterPage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<LoginForm> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  var hidePassword = true;
  Icon visibilityIcon = const Icon(Icons.visibility);

  void _viewPassword() {
    setState(() {
      hidePassword = !hidePassword;
      if (hidePassword) {
        visibilityIcon = const Icon(Icons.visibility);
      } else {
        visibilityIcon = const Icon(Icons.visibility_off);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildWelcomeText(),
                _buildInputField(),
                _buildLoginButton(),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _buildRegisterButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Container(
      width: 100,
      height: 100,
      child: Image.network(
        'https://i.postimg.cc/nLnC8FSD/MIAGED.png)',
      ),
    );
  }

  Widget _buildInputField() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _email,
            decoration: const InputDecoration(
              hintText: 'Email ',
              contentPadding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _password,
            decoration: InputDecoration(
              hintText: 'Mot de passe',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: _viewPassword,
              ),
              contentPadding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            ),
            obscureText: hidePassword,
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.70,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  primary: Colors.teal),
              label: const Text(
                "Se Connecter",
                style: TextStyle(
                  fontFamily: 'Alatsi',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(Icons.check),
              onPressed: _loginPressed,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.70,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  primary: Colors.teal),
              label: const Text(
                "S'inscrire",
                style: TextStyle(
                  fontFamily: 'Alatsi',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              onPressed: _registerPressed,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _loginPressed() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMyDialog('Aucun utilisateur trouvé pour cet e-mail.');
      } else if (e.code == 'wrong-password') {
        showMyDialog('Mauvais mot de passe fourni pour cet utilisateur.');
      }
    }
  }

  void _registerPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  Future<void> showMyDialog(String errorText) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(errorText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Accept'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
