import '../models/product_model.dart';

class ProductRepository {
  List<Product> getReadyToWear() {
    return [
      Product(
        name: "Blouse",
        image: "assets/images/blouse.jpg",
        price: "200.000",
        size: "M,L",
        color: "Abu-abu, Coklat",
        description: "Blouse batik ini menggabungkan keindahan motif tradisional dengan potongan stylish. Terbuat dari bahan berkualitas tinggi yang lembut dan breathable.",
      ),
      Product(
        name: "Dress",
        image: "assets/images/dress.jpg",
        price: "300.000",
        size: "S, M, L",
        color: "Black,Coklat",
        description: "Dress batik ini menggabungkan motif tradisional dan modern, cocok untuk acara formal.",
      ),
    ];
  }

  List<Product> getAccessories() {
    return [
      Product(
        name: "Scarf",
        image: "assets/images/scarf.jpg",
        price: "50.000",
        size: "One Size",
        color: "Biru, Hitam",
        description: "Scarf adalah sepotong kain panjang yang biasanya dikenakan di leher, kepala, atau bahu untuk memberikan kehangatan, sebagai aksesori fashion, atau untuk keperluan keagamaan dan budaya.",
      ),
      Product(
        name: "Bag",
        image: "assets/images/bag.jpeg",
        price: "80.000",
        size: "One Size",
        color: "Hitam, Coklat",
        description: "Tas batik adalah tas yang dibuat menggunakan kain batik, yang menampilkan motif khas tradisional Indonesia. Tas ini tidak hanya berfungsi sebagai wadah, tetapi juga sebagai aksesori fashion yang menonjolkan unsur budaya dan seni batik.",
      ),
    ];
  }

  List<Product> getPopularMotifs() {
    return [
      Product(
        name: "Motif Parang",
        image: "assets/images/motif parang.jpg",
        price: "100.000",
        size: "3,5 * 2,5",
        color: "Coklat, Hitam",
        description: "Motif batik Parang adalah salah satu motif batik klasik Indonesia yang bercirikan pola garis melengkung menyerupai ombak atau pedang, melambangkan keberanian, kekuatan, dan kontinuitas. ",
      ),
      Product(
        name: "Motif Mega Mendung",
        image: "assets/images/motif mega mendung.jpg",
        price: "150.000",
        size: "1,5 * 2,5",
        color: "Biru, Abu-abu",
        description: "Motif batik Mega Mendung adalah motif batik khas Cirebon yang menggambarkan bentuk awan berlapis-lapis dengan warna-warna cerah atau gradasi. Motif ini melambangkan ketenangan, kesejukan, dan kesabaran, terinspirasi oleh awan mendung di langit yang tenang.",
      ),
    ];
  }

  List<Product> getRecommendedMotifs() {
    return [
      Product(
        name: "Motif Ceplok",
        image: "assets/images/motif ceplok.jpg",
        price: "120.000",
        size: "2,5 * 4,5",
        color: "Coklat",
        description: "Motif batik Ceplok adalah motif batik yang terdiri dari pola geometris yang berulang, seperti lingkaran, bintang, atau bentuk simetris lainnya.",
      ),
      Product(
        name: "Motif Kawung",
        image: "assets/images/motif kawung.jpg",
        price: "130.000",
        size: "1,5 * 2,0",
        color: "Coklat, Hitam",
        description: "Motif batik Kawung adalah motif batik tradisional berbentuk pola bulat simetris yang menyerupai irisan buah kawung (buah aren atau kolang-kaling). Motif ini melambangkan keagungan, keseimbangan, dan kesucian, serta sering digunakan sebagai simbol kekuatan dan pengendalian diri dalam budaya Jawa.",
      ),
      Product(
        name: "Motif Sido Mukti",
        image: "assets/images/motif sido mukti.jpg",
        price: "120.000",
        size: "2,0 * 2,5",
        color: "Hitam, Coklat",
        description: "Motif batik Sido Mukti adalah salah satu motif batik tradisional Jawa yang memiliki makna filosofis mendalam, mencerminkan harapan untuk hidup dalam kemakmuran dan kebahagiaan. Motif ini biasanya terdiri dari pola geometris dan ornamen tumbuhan atau bunga yang diatur harmonis, sering dikenakan pada upacara pernikahan sebagai simbol doa agar pemakainya dapat mencapai kehidupan yang sejahtera dan penuh berkah.",
      ),
    ];
  }
}
