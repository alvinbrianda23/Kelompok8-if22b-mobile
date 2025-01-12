
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../views/tshirt_pendek_view.dart';
import '../views/tshirt_panjang_view.dart';

class HomeController extends GetxController {
  // Navigasi ke halaman T-shirt Panjang
  void navigateToTShirtPanjang(BuildContext context) {
    Get.to(() => TShirtPanjangView());
  }

  // Navigasi ke halaman T-shirt Pendek
  void navigateToTShirtPendek(BuildContext context) {
    Get.to(() => TShirtPendekView());
  }
}
