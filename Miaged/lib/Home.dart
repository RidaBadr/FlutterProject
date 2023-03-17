import 'package:flutter/material.dart';
import 'package:miaged/profile/ProfilePage.dart';
import 'Panier/Cart.dart';
import 'Panier/cart_service.dart';
import 'Produits/acheter.dart';
import 'package:miaged/drawer.dart';

class Home extends StatefulWidget {
  static String tag = 'home-page';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Item(),
    CartPage(cartItems: CartService.getCart()),
    Profile(),
  ];

  bool isHomePage = true;

  @override
  Widget build(BuildContext context) {
    final pages = _widgetOptions;

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
        isHomePage = (index == 0); // mettre à jour la variable isHomePage
      });
    }

    final body = Container(child: pages[selectedIndex]);

    return Scaffold(
      appBar: isHomePage
          ? AppBar(
              title: const Text(
                'MIAGED',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.teal,
              automaticallyImplyLeading: true,
            )
          : null,
      drawer: MainDrawer(),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 37, 137, 119),
        onTap: onItemTapped,
      ),
    );
  }
}
