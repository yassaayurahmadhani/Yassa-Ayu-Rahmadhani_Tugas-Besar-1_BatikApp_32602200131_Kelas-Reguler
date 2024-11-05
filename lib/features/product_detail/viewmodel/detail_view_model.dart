import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';

class DetailViewModel extends ChangeNotifier {
  List<Product> cart = []; // Simpan item keranjang

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners(); // Memberi tahu UI agar memperbarui tampilan jika ada perubahan
  }

  bool isInCart(Product product) {
    return cart.contains(product); // Mengecek apakah item sudah ada di keranjang
  }

  void removeFromCart(Product product) {
    cart.remove(product);
    notifyListeners();
  }
}
