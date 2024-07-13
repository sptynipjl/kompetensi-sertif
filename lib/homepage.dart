import 'package:flutter/material.dart';
import 'package:serkom1/data/dataKPU.dart';
import 'package:serkom1/dataPemilih.dart';
import 'package:serkom1/formEntri.dart';
import 'package:serkom1/informasi.dart';
import 'package:serkom1/komponen/button.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final nik = TextEditingController();
  final nama = TextEditingController();
  final noHp = TextEditingController();
  final tanggal = TextEditingController();
  final jeniskelamin = TextEditingController();
  final alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor('#FFFFFF')),
      body: SafeArea(
          child: Column(
        children: [
          // Heading 'KPU'
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 164, vertical: 62),
            child: Text('K P U',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(hexColor('5B9BBE')),
                )),
          ),

          // Information Button
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Information()),
                );
              },
              child: DefaultButton(actionName: 'Information'),
            ),
          ),

          // // Form Entry Button
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormEntry(
                      dataKPU: DataKPU(
                        nama: nama.text,
                        nik: nik.text,
                        noHP: noHp.text,
                        tanggal: tanggal.text,
                        jeniskelamin: jeniskelamin.text,
                        alamat: alamat.text,
                      ),
                    ),
                  ),
                );
              },
              child: DefaultButton(actionName: 'Form Entry'),
            ),
          ),
          // const SizedBox(height: 12),
          // const DefaultButton(actionName: 'Form Entry'),

          // // Lihat Data Button
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataPemilih()),
                );
              },
              child: DefaultButton(actionName: 'Lihat Data'),
            ),
          ),
          // const SizedBox(height: 12),
          // const DefaultButton(actionName: 'Lihat Data'),

          // // Keluar
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: DefaultButton(actionName: 'Keluar'),
            ),
          ),
          // const SizedBox(height: 12),
          // const DefaultButton(actionName: 'Keluar'),
        ],
      )),
    );
  }
}
