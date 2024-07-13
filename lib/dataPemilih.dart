// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:serkom1/data/dataKPU_User.dart';
import 'package:serkom1/database/firestore.dart';
import 'package:serkom1/homepage.dart';
import 'package:serkom1/komponen/data_Tile.dart';
// import 'package:sisfo_kpu/component/Data_Tile.dart';

// import 'package:sisfo_kpu/data/Data_KPU.dart';
// import 'package:sisfo_kpu/data/Data_KPU_User.dart';
// import 'package:sisfo_kpu/database/firestore.dart';
// import 'package:sisfo_kpu/homepage.dart';

class DataPemilih extends StatelessWidget {
  DataPemilih({super.key});

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

  FireStoreDatabase database = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Consumer2<DataPenggunaKPU, FireStoreDatabase>(
      builder: (context, value, fireStoreDBValue, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading 'Data Pemilih'
              const SizedBox(height: 60),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 24),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(hexColor('#D43300')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 24),
                    child: Text(
                      'Data Pemilih',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(hexColor('5B9BBE')),
                      ),
                    ),
                  ),
                ],
              ),

              // Streambuilder to get DataKPU
              StreamBuilder(
                  stream: database.getDataKPU(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    // Show Loading Circle
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Get data from snapshot
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Text('No current data'),
                        ),
                      );
                    } else {
                      final data = snapshot.data!.docs;

                      // Expanded
                      return Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final post = data[index];

                            //Get data from each collection
                            String nik = post['Nik'];
                            String nama = post['Nama'];
                            String noHp = post['noHp'];
                            String tanggal = post['Tanggal'];
                            String alamat = post['Alamat'];
                            String dropDownvalue = post['DropDownValue'];
                            String? images = post['ImagePath'];

                            // Display as tile
                            return DataPemilihTile(
                                nik: nik,
                                nama: nama,
                                noHp: noHp,
                                tanggal: tanggal,
                                jenisKelamin: dropDownvalue,
                                alamat: alamat,
                                imagePath: images);
                          },
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
