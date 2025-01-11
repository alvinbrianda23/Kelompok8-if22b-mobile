import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import '../controllers/alamat_controller.dart';
import 'alamat_update_view.dart';

class AlamatView extends GetView<AlamatController> {
  void showOption(String id) async {
    await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                AlamatUpdateView(),
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  void showAddDialog() async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController alamatController = TextEditingController();

    await Get.dialog(
      AlertDialog(
        title: Text('Add New Address'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  alamatController.text.isNotEmpty) {
                controller.tambah({
                  "nama": nameController.text,
                  "Kota": alamatController.text,
                });
                Get.back();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  // Function to open WhatsApp link in a browser (e.g., Chrome)
  void _launchWhatsApp() async {
    String phoneNumber = "628993037029"; // Ganti dengan nomor WhatsApp Anda
    String message = "Hello, I am interested in your services!";
    String url =
        "https://web.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar("Error", "Cannot open WhatsApp in browser");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alamat'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: showAddDialog,
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: Get.put(AlamatController()).StreamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data?.docs ?? [];
            return listAllDocs.isNotEmpty
                ? ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Color.fromARGB(255, 248, 248, 248),
                      ),
                      title: Text(
                          "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                      subtitle: Text(
                          "${(listAllDocs[index].data() as Map<String, dynamic>)["Kota"]}"),
                      trailing: IconButton(
                          onPressed: () => showOption(listAllDocs[index].id),
                          icon: Icon(Icons.more_vert)),
                    ),
                  )
                : Center(
                    child: Text("Empty"),
                  );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Tombol WhatsApp ditambahkan di bawah StreamBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: _launchWhatsApp, // Fungsi untuk membuka WhatsApp di browser
        child: Icon(Icons.chat),
        tooltip: "Contact via WhatsApp",
      ),
    );
  }
}
