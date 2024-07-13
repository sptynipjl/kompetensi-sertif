import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class FireStoreDatabase {
  //Initialise database
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Create a collection
  final CollectionReference data =
      FirebaseFirestore.instance.collection('Data Sisfo');

  // Function to Post data to Firestore
  Future<void> addDataKPU(String nik, String nama, String noHp, String tanggal,
      String alamat, String dropDownvalue, String? images) {
    return _firestore.collection('Data Sisfo').add({
      'Nik': nik,
      'Nama': nama,
      'noHp': noHp,
      'Tanggal': tanggal,
      'Alamat': alamat,
      'DropDownValue': dropDownvalue,
      'ImagePath': images,
      'TimeStamp': FieldValue.serverTimestamp(),
    });
  }

  // Read post from firestore
  Stream<QuerySnapshot> getDataKPU() {
    return _firestore
        .collection('Data Sisfo')
        .orderBy('TimeStamp', descending: true)
        .snapshots();
  }
}

  // File? _selectedImages;

  // final nik = TextEditingController();
  // final nama = TextEditingController();
  // final noHp = TextEditingController();
  // final tanggal = TextEditingController();
  // final alamat = TextEditingController();
  // String dropDownvalue = 'Laki laki';
