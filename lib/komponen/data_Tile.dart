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

int hexColor(String color) {
  //adding prefix
  // ignore: prefer_interpolation_to_compose_strings
  String newColor = '0xff' + color;
  //removing # sign
  newColor = newColor.replaceAll('#', '');
  // convert into integer
  int finalColor = int.parse(newColor);
  return finalColor;
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
            // Heading 'Nama Ormawa'
            const SizedBox(height: 16),
            Text(
              'NIK',
              style: TextStyle(
                fontSize: 14,
                color: Color(
                  hexColor('2D2D2D'),
                ),
              ),
            ),

            // Display nikcontroller
            const SizedBox(height: 6),
            Text(
              widget.nik,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(hexColor('5B9BBE')),
              ),
            ),

            // Heading 'Nama'
            const SizedBox(height: 16),
            Text(
              'Nama Lengkap',
              style: TextStyle(
                fontSize: 14,
                color: Color(
                  hexColor('2D2D2D'),
                ),
              ),
            ),

            // Display namaLengkapcontroller
            const SizedBox(height: 6),
            Text(
              widget.nama,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(hexColor('5B9BBE')),
              ),
            ),

            // Heading 'Jenis Kelamin'
            const SizedBox(height: 16),
            Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 14,
                color: Color(
                  hexColor('2D2D2D'),
                ),
              ),
            ),

            // Display jeniskelamincontroller
            const SizedBox(height: 6),
            Text(
              widget.jenisKelamin,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(hexColor('5B9BBE')),
              ),
            ),

            // Heading 'no HP'
            const SizedBox(height: 12),
            Text(
              'Nomor Handphone',
              style: TextStyle(
                fontSize: 14,
                color: Color(hexColor('2D2D2D')),
              ),
            ),

            // Display noHPcontroller
            const SizedBox(height: 6),
            Text(
              widget.noHp,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(hexColor('5B9BBE')),
              ),
            ),

            // Heading 'Tanggal'
            const SizedBox(height: 12),
            Text(
              'Tanggal Lahir',
              style: TextStyle(
                fontSize: 14,
                color: Color(hexColor('2D2D2D')),
              ),
            ),

            // Display tanggalLahircontroller
            const SizedBox(height: 6),
            Text(
              widget.tanggal,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(hexColor('5B9BBE')),
              ),
            ),

            // Heading 'Alamat'
            const SizedBox(height: 12),
            Text(
              'Alamat',
              style: TextStyle(
                fontSize: 14,
                color: Color(hexColor('2D2D2D')),
              ),
            ),

            // Display alamatcontroller
            const SizedBox(height: 6),
            Text(
              widget.alamat,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(hexColor('5B9BBE')),
              ),
            ),

            // Heading 'Gambar'
            const SizedBox(height: 12),
            Text(
              'Gambar',
              style: TextStyle(
                fontSize: 14,
                color: Color(hexColor('2D2D2D')),
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
