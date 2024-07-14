import 'dart:io';

import 'package:flutter/material.dart';

class DataPemilihTile extends StatefulWidget {
  final String nik;
  final String nama;
  final String noHp;
  final String tanggal;
  final String jenisKelamin;
  final String alamat;
  final String? imagePath;

  const DataPemilihTile({
    super.key,
    required this.nik,
    required this.nama,
    required this.noHp,
    required this.tanggal,
    required this.jenisKelamin,
    required this.alamat,
    required this.imagePath,
  });

  @override
  State<DataPemilihTile> createState() => _DataPemilihTileState();
}

class _DataPemilihTileState extends State<DataPemilihTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading 
            const SizedBox(height: 10),
            Text(
              'NIK',
              style: TextStyle(
                fontSize: 14,
              
                
              ),
            ),

            // Display nikcontroller
            Text(
              widget.nik,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 107, 35, 30),
              ),
            ),

            // Heading 'Nama'
            Text(
              'Nama Lengkap',
              style: TextStyle(
                fontSize: 14,
                
              ),
            ),

            // Display namaLengkapcontroller
            Text(
              widget.nama,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 107, 35, 30),
              ),
            ),

            // Heading 'Jenis Kelamin'
            Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            // Display jeniskelamincontroller
            Text(
              widget.jenisKelamin,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 107, 35, 30)
              ),
            ),

            // Heading 'no HP'
            Text(
              'Nomor Handphone',
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            // Display noHPcontroller
            Text(
              widget.noHp,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 107, 35, 30),
              ),
            ),

            // Heading 'Tanggal'
            Text(
              'Tanggal Lahir',
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            // Display tanggalLahircontroller
            Text(
              widget.tanggal,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 107, 35, 30),
              ),
            ),

            // Heading 'Alamat'
            Text(
              'Alamat',
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            // Display alamatcontroller
            Text(
              widget.alamat,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 107, 35, 30),
              ),
            ),

            // Heading 'Gambar'
            Text(
              'Gambar',
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            // Display tanggalLahircontroller
            const SizedBox(height: 6),
            widget.imagePath != null
                ? Image.file(
                    File(widget.imagePath!),
                    height: 400, // Sesuaikan dengan ukuran yang diinginkan
                    width: double.infinity, // Lebar mengisi ruang yang tersedia
                    fit: BoxFit.cover, // Memastikan gambar terisi dengan baik
                  )
                : const Text('No Image Selected'), //
          ],
        ),
      ),
    );
  }
}
