import 'package:miaged/Classes/article.dart';




class CartService {
  static List<Article> cartItems = [];

  static List<Article> getCart() {
    return cartItems;
  }

  static Article getArticleById(int id) {
    return cartItems.firstWhere((element) => element.id == id);
  }

  static void addToCart(Article article) {
    cartItems.add(article);
  }

  static void removeFromCart(Article article) {
    cartItems.remove(article);
  }

  static int getCartItemCount() {
    return cartItems.length;
  }

  static double getCartTotal() {
    double total = 0.0;
    for (Article item in cartItems) {
      total += double.parse(item.prix);
    }
    return total;
  }

  static void clearCart() {
    cartItems.clear();
  }
}