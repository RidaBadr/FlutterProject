import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Authentification/login_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userID = '';
  String userMail = '';
  String userLogin = '';
  String userPassword = '';
  String userBirthday = '';
  String userAddress = '';
  String userPostcode = '';
  String userCity = '';

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('User').doc('user1').get();
    final data = snapshot.data() as Map<String, dynamic>;
    setState(() {
      userID = snapshot.id;
      userID = data['id'];
      userMail = data['mail'];
      userLogin = data['login'];
      userPassword = data['motDePass'];
      userBirthday = data['Anniversaire'];
      userAddress = data['adresse'];
      userPostcode = data['codePostal'];
      userCity = data['ville'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController(text: userMail);
    final loginController = TextEditingController(text: userLogin);
    final passwordController = TextEditingController(text: userPassword);
    final birthdayController = TextEditingController(text: userBirthday);
    final addressController = TextEditingController(text: userAddress);
    final postcodeController = TextEditingController(text: userPostcode);
    final cityController = TextEditingController(text: userCity);

    final mail = Text(userMail,
        style: const TextStyle(
            fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center);
    final login = TextFormField(
      controller: loginController,
      enabled:
          false, // ajout de la propriété enabled pour désactiver l'édition du champ
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Badr RIDA',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Mot de passe',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final birthday = TextFormField(
      controller: birthdayController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Anniversaire',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final address = TextFormField(
      controller: addressController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Adresse',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final postcode = TextFormField(
      controller: postcodeController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Code postal',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final city = TextFormField(
      controller: cityController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Ville',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final saveButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () async {
          await FirebaseFirestore.instance
              .collection('User')
              .doc('user1')
              .update({
            'login': loginController.text,
            'motDePass': passwordController.text,
            'Anniversaire': birthdayController.text,
            'adresse': addressController.text,
            'codePostal': postcodeController.text,
            'ville': cityController.text,
          }).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Modification(s) enregistrée(s)'),
              ),
            );
          });
        },
        child: const Text('Valider', style: TextStyle(color: Colors.white)),
      ),
    );

    final deconnection = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.all(12),
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginForm()),
            );
          },
          child: const Text('Se Déconnecter',
              style: TextStyle(color: Colors.white)),
        ));

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        const SizedBox(height: 48.0),
        mail,
        const SizedBox(height: 8.0),
        login,
        const SizedBox(height: 8.0),
        password,
        const SizedBox(height: 8.0),
        birthday,
        const SizedBox(height: 8.0),
        address,
        const SizedBox(height: 8.0),
        postcode,
        const SizedBox(height: 8.0),
        city,
        const SizedBox(height: 24.0),
        saveButton,
        deconnection
      ],
    );
  }
}
