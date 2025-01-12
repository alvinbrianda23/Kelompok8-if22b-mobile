
import 'package:get/get.dart';

class HasilController extends GetxController {
  // Track apakah T-shirt itu lengan panjang atau pendek
  var isLongSleeve = false.obs;

  // Track apakah saat ini bagian depan atau belakang yang ditampilkan
  var isFront = true.obs;

  // Method untuk mengubah status T-shirt menjadi lengan panjang atau pendek
  void setLongSleeve(bool value) {
    isLongSleeve.value = value;
  }

  // Method untuk mengubah status tampilan depan atau belakang
  void toggleFrontBack() {
    isFront.value = !isFront.value;
  }
}
