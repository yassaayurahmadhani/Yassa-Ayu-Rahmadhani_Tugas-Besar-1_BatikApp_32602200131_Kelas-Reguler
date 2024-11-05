import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/product_model.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int cartItemCount = 0; // Variabel untuk menyimpan jumlah item di keranjang

  // Fungsi untuk menambah item ke keranjang dan memperbarui jumlah item
  void addToCart() {
    setState(() {
      cartItemCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Produk berhasil ditambahkan ke keranjang!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back.png',
            color: Color(0xFFD4A373),
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/share.png',
              color: Color(0xFFD4A373),
              width: 24.0,
              height: 24.0,
            ),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4A373),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar di sebelah kiri
                Image.asset(
                  widget.product.image,
                  height: 250,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16), // Spasi antara gambar dan teks
                // Kolom teks di sebelah kanan
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Harga', style: TextStyle(color: Colors.grey)),
                          Text(
                            "Rp ${widget.product.price}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD4A373),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8), // Jarak antara elemen
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ukuran (meter)', style: TextStyle(color: Colors.grey)),
                          Text(
                            widget.product.size,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD4A373),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8), // Jarak antara elemen
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Warna', style: TextStyle(color: Colors.grey)),
                          Text(
                            widget.product.color,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD4A373),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Deskripsi Motif',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4A373),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.description, // Menggunakan deskripsi dari ProductRepository
              style: TextStyle(color: Colors.grey[800]),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/love.png',
                    width: 24.0,
                    height: 24.0,
                    color: Colors.red, // Mengatur warna menjadi merah
                  ),
                  onPressed: () {
                    // Implement add to favorite
                  },
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: addToCart, // Memanggil fungsi addToCart
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD4A373),
                    ),
                    child: Text('Masukkan ke Keranjang'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) { // Index 1 adalah tombol "home"
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Image.asset(
                  'assets/images/keranjang.png',
                  width: 24.0,
                  height: 24.0,
                ),
                if (cartItemCount > 0) // Menampilkan badge hanya jika ada item
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$cartItemCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 35.0,
              height: 35.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/akun.png',
              width: 24.0,
              height: 24.0,
            ),
            label: '',
          ),
        ],
        backgroundColor: const Color(0xFFD4A373),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
