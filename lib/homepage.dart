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


  final nik = TextEditingController();
  final nama = TextEditingController();
  final noHp = TextEditingController();
  final tanggal = TextEditingController();
  final jeniskelamin = TextEditingController();
  final alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Heading 'KPU'
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
                children: [
                  Image.asset(
                    'lib/images/logoKPU.png', // Path to your logo
                    width: 80, // Adjust size as needed
                    height: 80, // Adjust size as needed
                  ),
                  
                  Text('K P U',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              ),
          ),
          

          // Information Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 107, 35, 30)),
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
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 107, 35, 30)),
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
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 107, 35, 30)),
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
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 107, 35, 30)),
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
