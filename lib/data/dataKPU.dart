import 'package:flutter/material.dart';

class DataKPU extends ChangeNotifier {
  String nama;
  String nik;
  String noHP;
  String tanggal;
  String jeniskelamin;
  String alamat;
  String? imagePath;

  DataKPU({
    required this.nama,
    required this.nik,
    required this.noHP,
    required this.tanggal,
    required this.jeniskelamin,
    required this.alamat,
    this.imagePath,
  });

  void updateData(
      String newNama, String newNik, String newNoHP, String newTanggal) {
    nama = newNama;
    nik = newNik;
    noHP = newNoHP;
    tanggal = newTanggal;
    notifyListeners();
  }

  void addItemToCart(DataKPU item) {
    // Add item logic
    notifyListeners();
  }
}
