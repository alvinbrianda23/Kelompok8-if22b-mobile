
import 'package:flutter/material.dart';

class HasilView extends StatelessWidget {
  final List<Map<String, double>> stickerPositions;

  HasilView({required this.stickerPositions});

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
                'assets/images/tshirt_panjang_front.png', // Bisa ditentukan apakah front atau back
                width: 200,
                fit: BoxFit.contain,
              ),
              ..._buildStickers(),
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
