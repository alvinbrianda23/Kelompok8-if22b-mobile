
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Inisialisasi HomeController sebagai dependensi
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
