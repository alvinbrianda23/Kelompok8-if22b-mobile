import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/alamat_controller.dart';

class AlamatUpdateView extends GetView<AlamatController> {
  @override
  Widget build(BuildContext context) {
    // Menerima argument ID yang dikirim dari AlamatView
    final String id = Get.arguments;

    // Controller untuk mengedit nama dan kota
    final TextEditingController nameController = TextEditingController();
    final TextEditingController alamatController = TextEditingController();

    // Fungsi untuk memuat data awal ke controller
    Future<void> loadData() async {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('alamat').doc(id).get();
      if (doc.exists) {
        nameController.text = doc['nama'];
        alamatController.text = doc['Kota'];
      }
    }

    // Memuat data saat halaman pertama kali dibuka
    loadData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isNotEmpty && alamatController.text.isNotEmpty) {
                      // Memperbarui data di Firestore
                      await controller.Update(id, {
                        "nama": nameController.text,
                        "Kota": alamatController.text,
                      });
                      Get.back();
                    } else {
                      Get.snackbar('Error', 'Please fill all fields');
                    }
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
