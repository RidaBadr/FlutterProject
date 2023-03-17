import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged/Classes/article.dart';

import '../Panier/cart_service.dart';

class ItemDetails extends StatefulWidget {
  var id = "";

  ItemDetails({super.key, required this.id});

  @override
  State<ItemDetails> createState() => _ItemDetailsState(id);
}

class _ItemDetailsState extends State<ItemDetails> {
  Article article = Article("", "", "", "", "", "", "");

  List<Article> articles = [];
  String itemID = "";
  bool isInCart = false;

  Future<Article> getArticles(String id) async {
    Article article = Article("", "", "", "", "", "", "");
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Vetements');
    await collectionReference.doc(id).get().then((value) {
      article = Article(value["nom"], value["marque"], value["image"],
          value["prix"], value["taille"], value["type"], id);
    });
    return article;
  }

  _ItemDetailsState(String id) {
    getArticles(id).then((value) {
      setState(() {
        article = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getArticles(widget.id).then((value) {
      setState(() {
        article = value;
        isInCart = CartService.getCart().contains(article);
      });
    });
  }

  void showAddToCartBanner() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Article à été bien ajouté au panier.',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        backgroundColor: Colors.green[100],
        action: SnackBarAction(
          label: 'Ok',
          textColor: Colors.green,
          onPressed: () {
            // Code to execute.
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final addToCart = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.all(13),
        ),
        onPressed: () {
          CartService.addToCart(article);
          setState(() {
            isInCart = true;
          });
          showAddToCartBanner();
        },
        child: const Text('Ajouter au panier'),
      ),
    );

    final removeToCart = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Colors.lightBlueAccent,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () async {
          CollectionReference collectionReference =
              FirebaseFirestore.instance.collection('panier');
          await collectionReference.doc(article.id).delete();
        },
        child: const Text('Supprimer du panier'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails"),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          Image.network(article.image, height: 600, fit: BoxFit.cover),
          Text(article.nom,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              textAlign: TextAlign.center),
          Text(article.marque,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center),
          Text('${article.prix.toString()}€',
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center),
          Text('Taille : ${article.taille}',
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center),
          Text(article.type,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center),
          if (article.id != "") addToCart else removeToCart,
        ],
      ),
    );
  }
}
