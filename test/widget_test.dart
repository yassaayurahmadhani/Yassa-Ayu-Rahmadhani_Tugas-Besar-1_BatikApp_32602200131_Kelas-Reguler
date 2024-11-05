import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:BatikApp/main.dart';

void main() {
  testWidgets('BatikApp home screen test', (WidgetTester tester) async {
    await tester.pumpWidget(BatikApp());
    await tester.pumpAndSettle();

    // Verifikasi judul aplikasi (sesuaikan dengan judul yang benar)
    expect(find.text('Hai Putri, Ayo Pakai Batik-mu!'), findsOneWidget);
    
    // Verifikasi kehadiran search bar
    expect(find.byType(TextField), findsOneWidget);

    // Verifikasi tampilan kategori
    expect(find.text('Kain'), findsOneWidget);
    expect(find.text('Siap Pakai'), findsOneWidget);
    expect(find.text('Aksesoris'), findsOneWidget);

    // Verifikasi bottom navigation bar jika ada
    expect(find.byType(BottomNavigationBar), findsOneWidget); // Ubah menjadi findsOneWidget jika ada
  });
}
