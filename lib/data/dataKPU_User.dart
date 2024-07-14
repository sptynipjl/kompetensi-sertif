// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:serkom1/data/dataKPU.dart';

class DataPenggunaKPU extends ChangeNotifier {
  // List Data
  final List<DataKPU> _data = [
    DataKPU(
      nama: '',
      nik: '',
      tanggal: '',
      noHP: '',
      jeniskelamin: '',
      alamat: '',
    ),
  ];

  // userData
  List<DataKPU> _userData = [];

  // Get Data List
  List<DataKPU> get dataPenggunaKPU => _data;

  // Get userData
  List<DataKPU> get userData => _userData;

  get length => null;

  // Add data to Description
  void addUserData(DataKPU dataKPU) {
    _userData.add(dataKPU);
    notifyListeners();
  }
}
