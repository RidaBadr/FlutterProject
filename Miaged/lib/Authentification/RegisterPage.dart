import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();

  var hidePassword = true;
  var hideConfirmPassword = true;

  Icon visibilityIcon = const Icon(Icons.visibility);
  Icon visibilityIconConfirm = const Icon(Icons.visibility);

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
      appBar: AppBar(
        title: const Text("Inscription", textAlign: TextAlign.center),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _buildWelcomeText(),
            _buildInputField(),
            _buildRegisterButton(),
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
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _passwordConfirmation,
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
                "Enregistrer",
                style: TextStyle(
                  fontFamily: 'Alatsi',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(Icons.check),
              onPressed: _signupPressed,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _signupPressed() async {
    if (_password.text == _passwordConfirmation.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);

        var currentUser = FirebaseAuth.instance.currentUser;

        FirebaseFirestore.instance
            .collection('UserInformations')
            .doc(currentUser!.uid)
            .set({
          'Adress': 'Entrez une adresse',
          'Birthday': DateTime.now(),
          'City': 'Entrez une ville',
          'Postal': 'Entrez un code postal',
        });

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginForm()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showMyDialog('Le mot de passe fourni est trop faible.');
        } else if (e.code == 'email-already-in-use') {
          showMyDialog('Le compte existe déjà pour cet e-mail..');
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } else {
      showMyDialog(
          "Les mots de passe ne correspondent pas, veuillez réessayer");
    }
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
              child: const Text('OK'),
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
