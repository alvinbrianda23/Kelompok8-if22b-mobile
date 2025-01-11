import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/alamat_controller.dart';

class AlamatAddView extends GetView<AlamatController> {
  @override
  Widget build(BuildContext context) {
    // Controller untuk memasukkan nama dan kota
    final TextEditingController nameController = TextEditingController();
    final TextEditingController alamatController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Address'),
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
                      // Menambahkan data ke Firestore
                      await controller.tambah({
                        "nama": nameController.text,
                        "Kota": alamatController.text,
                      });
                      Get.back();
                    } else {
                      Get.snackbar('Error', 'Please fill all fields');
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
