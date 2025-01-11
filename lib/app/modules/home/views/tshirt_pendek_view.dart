import 'package:flutter/material.dart';
import 'package:myapp/app/modules/hasil/views/hasil_view1.dart'; // Import HasilView.dart from a separate file

class TShirtPendekView extends StatefulWidget {
  @override
  _TShirtPendekViewState createState() => _TShirtPendekViewState();
}

class _TShirtPendekViewState extends State<TShirtPendekView> {
  bool isFront = true; // Untuk menentukan bagian depan atau belakang
  List<Widget> stickers = []; // Daftar stiker yang ditambahkan
  List<Map<String, double>> stickerPositions = []; // Menyimpan posisi stiker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T-Shirt Pendek'),
        backgroundColor: Color(0xFFFF9A8B),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              isFront ? 'FRONT' : 'BACK',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      isFront
                          ? 'assets/images/tshirt_pendek_front.png'
                          : 'assets/images/tshirt_pendek_back.png',
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  ...stickers, // Render stiker yang telah ditambahkan
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    setState(() {
                      isFront = true;
                    });
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    setState(() {
                      isFront = false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _addSticker(),
                  child: Text('Tambahkan Stiker'),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF9A8B)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _uploadDesign(context), // Navigasi ke HasilView
                  child: Text('Upload Desain'),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8BC34A)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addSticker() {
    setState(() {
      stickers.add(
        Positioned(
          left: 100,
          top: 150,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                // Update posisi stiker saat di-drag
                final RenderBox renderBox = context.findRenderObject() as RenderBox;
                final localPosition = renderBox.globalToLocal(details.globalPosition);
                stickers.removeLast();
                stickers.add(
                  Positioned(
                    left: localPosition.dx - 50,
                    top: localPosition.dy - 50,
                    child: _stickerWidget(),
                  ),
                );
                stickerPositions.add({
                  'left': localPosition.dx - 50,
                  'top': localPosition.dy - 50,
                });
              });
            },
            child: _stickerWidget(),
          ),
        ),
      );
    });
  }

  void _uploadDesign(BuildContext context) {
    // Kirim posisi stiker ke HasilView
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HasilView1(stickerPositions: stickerPositions),
      ),
    );
  }

  Widget _stickerWidget() {
    return Image.asset(
      'assets/images/sticker.png',
      width: 50,
      height: 50,
    );
  }
}
