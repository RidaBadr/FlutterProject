import 'package:flutter/material.dart';
import '../Classes/article.dart';
import '../drawer.dart';
import 'cart_service.dart';

class CartPage extends StatefulWidget {
  final List<Article> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartService _cartService = CartService();

  @override
  Widget build(BuildContext context) {
    List<Article> cartItems = CartService.getCart();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PANIER',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: true,
      ),
      drawer: MainDrawer(),
      body: cartItems.isEmpty
          ? Center(
              child: Text('Le panier est vide'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(cartItems[index].image),
                  title: Text(cartItems[index].nom),
                  subtitle: Text('${cartItems[index].prix}\$'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        CartService.removeFromCart(cartItems[index]);
                      });
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total: ${CartService.getCartTotal().toStringAsFixed(2)}\$',
                  style: TextStyle(fontSize: 20.0),
                  selectionColor: Colors.teal,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 37, 137, 119),
                  ),
                  onPressed: () {
                    CartService.clearCart();
                    setState(() {});
                  },
                  child: Text('Vider le panier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
