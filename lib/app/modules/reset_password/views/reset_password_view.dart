import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/reset_password/controllers/reset_password_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final cAuth = Get.find<AuthController>();

  ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF9A8B), Color(0xFFFAD0C4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "RESET PASSWORD",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(
                        255, 255, 255, 255), // Tambahkan warna teks di sini
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman signup
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: Text("Back"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
