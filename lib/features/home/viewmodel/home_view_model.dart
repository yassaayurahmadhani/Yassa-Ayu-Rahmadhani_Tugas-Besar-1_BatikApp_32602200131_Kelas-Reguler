import 'package:flutter/foundation.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductRepository repository = ProductRepository();
  
  String _selectedCategory = 'kain';
  String get selectedCategory => _selectedCategory;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners(); // Memastikan UI mendapatkan notifikasi saat kategori berubah
  }

  List<Product> getPopularMotifs() => repository.getPopularMotifs();
  List<Product> getRecommendedMotifs() => repository.getRecommendedMotifs();
  List<Product> getReadyToWear() => repository.getReadyToWear();
  List<Product> getAccessories() => repository.getAccessories();
}
