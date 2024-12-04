import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  LoginView({super.key});
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
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.star, color: Colors.orange, size: 40),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "let's start with us 👋",
                style: TextStyle(fontSize: 18, color: Colors.black),
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
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
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
                onPressed: () {
                   Get.offAllNamed(Routes.HOME);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),                
              child: Text(
                "Log In",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 255, 255), // Tambahkan warna teks di sini
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("or sign in with"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.apple),
                    iconSize: 30,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman signup
                      Get.offAllNamed(Routes.SIGNUP);
                    },
                    child: Text("Sign up"),
                  ),
                  TextButton(
                    onPressed: () {

                      Get.offAllNamed(Routes.RESET_PASSWORD);
                    },
                    child: Row(
                      children: [
                        Text("Forgot password"),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
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