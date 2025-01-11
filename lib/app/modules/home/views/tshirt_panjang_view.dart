import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/app/modules/hasil/views/hasil_view.dart'; // Import HasilView.dart from a separate file

class TShirtPanjangView extends StatefulWidget {
  @override
  _TShirtPanjangViewState createState() => _TShirtPanjangViewState();
}

class _TShirtPanjangViewState extends State<TShirtPanjangView> {
  bool isFront = true; // To switch between front and back of the T-shirt
  List<Widget> stickers = []; // List of added stickers
  List<Map<String, double>> stickerPositions = []; // List to store sticker positions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T-Shirt Panjang'),
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
                          ? 'assets/images/tshirt_panjang_front.png'
                          : 'assets/images/tshirt_panjang_back.png',
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  ...stickers, // Render added stickers
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
                  onPressed: () => _uploadDesign(context),
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
      double initialX = 100;
      double initialY = 150;

      // Add the new sticker to the stickers list and its position to stickerPositions list
      stickers.add(
        Positioned(
          left: initialX,
          top: initialY,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                final RenderBox renderBox = context.findRenderObject() as RenderBox;
                final localPosition = renderBox.globalToLocal(details.globalPosition);

                // Update the sticker's position while dragging
                stickers[stickers.length - 1] = Positioned(
                  left: localPosition.dx - 50, // Adjust to the sticker's size
                  top: localPosition.dy - 50,
                  child: _stickerWidget(),
                );
                stickerPositions[stickerPositions.length - 1] = {
                  'left': localPosition.dx - 50,
                  'top': localPosition.dy - 50,
                };
              });
            },
            child: Listener(
              onPointerDown: (event) {
                // Ignore right-click or other unnecessary mouse events
                if (event.kind == PointerDeviceKind.mouse && event.buttons == kSecondaryButton) {
                  return;
                }
              },
              child: _stickerWidget(),
            ),
          ),
        ),
      );

      // Add the sticker's position to stickerPositions
      stickerPositions.add({
        'left': initialX,
        'top': initialY,
      });
    });
  }

  void _uploadDesign(BuildContext context) {
    // Send sticker positions to the HasilView screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HasilView(stickerPositions: stickerPositions),
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
