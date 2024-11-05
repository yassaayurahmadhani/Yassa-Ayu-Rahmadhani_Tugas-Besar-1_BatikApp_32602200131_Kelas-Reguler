import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/section_title.dart';
import '../../../data/models/product_model.dart';
import '../viewmodel/home_view_model.dart';
import '../../product_detail/view/detail_screen.dart'; // Pastikan Anda memiliki DetailScreen untuk navigasi

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: AppColors.primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai Putri, Ayo Pakai Batik-mu!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accent,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Cari motif batik...',
                          prefixIcon: Image.asset('assets/images/search.png', width: 24.0, height: 24.0),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () => viewModel.setCategory('kain'),
                              child: Text('Kain'),
                            ),
                            TextButton(
                              onPressed: () => viewModel.setCategory('siap_pakai'),
                              child: Text('Siap Pakai'),
                            ),
                            TextButton(
                              onPressed: () => viewModel.setCategory('aksesoris'),
                              child: Text('Aksesoris'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (viewModel.selectedCategory == 'kain') ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionTitle(title: 'Paling Populer'),
                          IconButton(
                            icon: Image.asset(
                              'assets/images/panah.png', // Path to sort icon
                              width: 24.0,
                              height: 24.0,
                            ),
                            onPressed: () {
                              // Implement sorting functionality here
                            },
                          ),
                        ],
                      ),
                    ),
                    buildMotifList(viewModel.getPopularMotifs(), context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionTitle(title: 'Rekomendasi Untukmu'),
                          Transform.translate(
                            offset: Offset(0, -160.0), // Sesuaikan nilai ini untuk lebih menaikkan posisi ikon
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/kanan.png', // Path to right arrow icon
                                width: 30.0,
                                height: 30.0,
                              ),
                              onPressed: () {
                                // Navigate to more recommendations
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildMotifList(viewModel.getRecommendedMotifs(), context),
                  ] else if (viewModel.selectedCategory == 'siap_pakai') ...[
                    SectionTitle(title: 'Siap Pakai'),
                    buildMotifList(viewModel.getReadyToWear(), context),
                  ] else if (viewModel.selectedCategory == 'aksesoris') ...[
                    SectionTitle(title: 'Aksesoris'),
                    buildMotifList(viewModel.getAccessories(), context),
                  ],
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/keranjang.png', // Path to cart icon
                width: 24.0,
                height: 24.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/home.png', // Path to home icon
                width: 35.0,
                height: 35.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/akun.png', // Path to profile icon
                width: 24.0,
                height: 24.0,
              ),
              label: '',
            ),
          ],
          backgroundColor: AppColors.primary,
          currentIndex: 1,
          selectedItemColor: AppColors.accent,
          onTap: (index) {
            // Handle bottom navigation based on index
          },
        ),
      ),
    );
  }

  Widget buildMotifList(List<Product> motifs, BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: motifs.length,
        itemBuilder: (context, index) {
          final motif = motifs[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(product: motif),
                ),
              );
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.all(8),
              child: Card(
                child: Column(
                  children: [
                    Image.asset(motif.image, height: 120, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        motif.name,
                        style: TextStyle(fontSize: 14, color: AppColors.accent),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      motif.price,
                      style: TextStyle(fontSize: 14, color: AppColors.accent),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (i) {
                        return Image.asset(
                          'assets/images/star_full.png', // Path to star icon
                          width: 20.0,
                          height: 20.0,
                          color: i < 4 ? Colors.amber : Colors.grey, // Rating color
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
