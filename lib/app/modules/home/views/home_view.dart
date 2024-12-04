import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            cAuth.logout();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 105, 150, 34),
            foregroundColor: Colors.white,
          ),
          child: const Text("Login"),
        ),
      ),
    );
  }
}
