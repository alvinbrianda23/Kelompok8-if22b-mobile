import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AlamatController extends GetxController {
  // Instansiasi Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream untuk mengambil data alamat
  Stream<QuerySnapshot<Object?>> StreamData() {
    return _firestore.collection('alamat').snapshots();
  }

  // Fungsi untuk menambahkan data ke Firestore
  Future<void> tambah(Map<String, dynamic> data) async {
    try {
      // Menambahkan data ke koleksi 'alamat'
      await _firestore.collection('alamat').add(data);
      Get.snackbar('Success', 'Data added successfully');
    } catch (e) {
      // Menampilkan pesan error jika gagal menambahkan data
      Get.snackbar('Error', 'Failed to add data: $e');
    }
  }

  // Fungsi untuk menghapus data berdasarkan ID
  Future<void> delete(String id) async {
    try {
      // Menghapus data berdasarkan ID dari koleksi 'alamat'
      await _firestore.collection('alamat').doc(id).delete();
      Get.snackbar('Success', 'Data deleted successfully');
    } catch (e) {
      // Menampilkan pesan error jika gagal menghapus data
      Get.snackbar('Error', 'Failed to delete data: $e');
    }
  }

  // Fungsi untuk memperbarui data (opsional, jika ingin menambahkan fitur update)
  Future<void> Update(String id, Map<String, dynamic> updatedData) async {
    try {
      // Memperbarui data berdasarkan ID di koleksi 'alamat'
      await _firestore.collection('alamat').doc(id).update(updatedData);
      Get.snackbar('Success', 'Data updated successfully');
    } catch (e) {
      // Menampilkan pesan error jika gagal memperbarui data
      Get.snackbar('Error', 'Failed to update data: $e');
    }
  }
}
