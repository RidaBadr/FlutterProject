import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final faqList = [
    {
      'question': 'Comment puis-je ajouter un article à mon panier ?',
      'answer':
      'Pour ajouter votre article à votre panier, suivez ces étapes simples : \n1. Faites défiler tous les produits proposés sur votre écran \n2.Choisissez un produit et remplissez les détails"  \n3. Mettez votre produit dans votre panier en cliquant sur ... (à venir)" \n4. Vous pouvez consulter votre panier maintenant.'},
    {
      'question': 'Comment puis-je ajouter une nouvelle adresse de livraison à mon compte MIAGED ?',
      'answer':
      'Pour ajouter une nouvelle adresse de livraison, suivez ces étapes simples:/ \n1. Connectez-vous à votre compte MIAGED\n2. Accédez à Mon compte > Paramètres >\n3. Ajoutez les détails de votre nouvelle adresse\n4. Choisissez \'Enregistrer les modifications\''
    },

  ];

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      appBar: AppBar(
        title: Text('MIAGED FAQ'),
        titleSpacing: 0.0,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final item = faqList[index];
          return Container(
            child: Card(
              elevation: 2.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: fullWidth - 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${item['question']}',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, right: 8.0, left: 8.0, bottom: 8.0),
                          child: Text(
                            '${item['answer']}',
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 1.6,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
