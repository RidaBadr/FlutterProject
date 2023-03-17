import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged/Classes/article.dart';
import 'DetailProduit.dart';

class Item extends StatefulWidget {
  const Item({super.key});
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> with TickerProviderStateMixin {
  List<Article> articles = [];
  List<Article> articlesCopy = [];
  List<Tab> tabs = [
    const Tab(text: "Tous"),
    const Tab(text: "Hommes"),
    const Tab(text: "Femmes"),
    const Tab(text: "Enfants"),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Vetements');
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var doc in querySnapshot.docs) {
      articles.add(Article(doc["nom"], doc["marque"], doc["image"], doc["prix"],
          doc["taille"], doc["type"], doc.reference.id));
    }
    return articles;
  }

  _ItemState() {
    getArticles().then((value) {
      setState(() {
        articles = value;
        articlesCopy = articles;
      });
    });
  }

  void _filterItem(int index) {
    setState(() {
      switch (index) {
        case 0:
          articles = articlesCopy;
          break;
        case 1:
          articles = articlesCopy
              .where((element) => element.type == "Hommes")
              .toList();
          break;
        case 2:
          articles = articlesCopy
              .where((element) => element.type == "Femmes")
              .toList();
          break;
        case 3:
          articles = articlesCopy
              .where((element) => element.type == "Enfants")
              .toList();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = GridView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetails(
                  id: articles[index].id,
                ),
              ),
            );
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(articles[index].image,
                    height: 200, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Text(articles[index].nom,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
              Text('${articles[index].prix.toString()}€',
                  style: const TextStyle(fontSize: 15)),
              Text(articles[index].taille,
                  style: const TextStyle(fontSize: 15)),
            ],
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, childAspectRatio: 223 / 350),
      padding: const EdgeInsets.all(10),
      shrinkWrap: false,
    );
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: tabs,
        onTap: _filterItem,
        isScrollable: true,
        labelStyle: const TextStyle(fontSize: 20),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
      ),
      body: body,
    );
  }
}
