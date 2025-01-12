
import 'package:flutter/material.dart';
import 'package:myapp/app/modules/alamat/views/alamat_view.dart'; // Import AlamatView dengan path yang benar

class HasilView1 extends StatelessWidget {
  final List<Map<String, double>> stickerPositions;

  HasilView1({required this.stickerPositions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Desain'),
        backgroundColor: Color(0xFFFF9A8B),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/tshirt_pendek_front.png', // Bisa ditentukan apakah front atau back
                width: 200,
                fit: BoxFit.contain,
              ),
              ..._buildStickers(),
              Positioned(
                bottom: 20,  // Posisi tombol di bawah
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman alamat
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlamatView(),
                        ),
                      );
                    },
                    child: Text('Pesan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF9A8B), // Warna tombol sesuai dengan AppBar
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStickers() {
    return stickerPositions.map((position) {
      return Positioned(
        left: position['left']!,
        top: position['top']!,
        child: _stickerWidget(),
      );
    }).toList();
  }

  Widget _stickerWidget() {
    return Image.asset(
      'assets/images/sticker.png',
      width: 50,
      height: 50,
    );
  }
}
