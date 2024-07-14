// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:serkom1/data/dataKPU.dart';
import 'package:serkom1/data/dataKPU_User.dart';
import 'package:serkom1/database/firestore.dart';
import 'package:serkom1/komponen/alamatField.dart';
import 'package:serkom1/komponen/submit_button.dart';
import 'package:serkom1/komponen/tanggalField.dart';
import 'package:serkom1/komponen/textfield.dart';
import 'homepage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/services.dart';

class FormEntry extends StatefulWidget {
  final DataKPU dataKPU;
  const FormEntry({
    super.key,
    required this.dataKPU,
  });

  @override
  State<FormEntry> createState() => _FormEntryState();
}

class _FormEntryState extends State<FormEntry> {
  

  File? _selectedImages;

  final nik = TextEditingController();
  final nama = TextEditingController();
  final noHp = TextEditingController();
  final tanggal = TextEditingController();
  final alamat = TextEditingController();
  String dropDownvalue = 'Laki laki';

  Future<void> _getCurrentLocation() async {
    // Cek apakah layanan lokasi sudah diaktifkan
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'),
        ),
      );
      return;
    }

    // Cek izin lokasi
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location permissions are denied'),
          ),
        );
        return;
      }
    }

    // Ambil posisi saat ini
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark tempat = placemarks[0];
      setState(() {
        alamat.text = '${tempat.subLocality}, ${tempat.locality}, ${tempat.administrativeArea}, ${tempat.country}';
      });

      // Salin alamat ke clipboard (opsional)
      await Clipboard.setData(ClipboardData(text: alamat.text));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terjadi masalah dalam membaca lokasi'),
        ),
      );
      return;
    }

    // // Update nilai alamat
    // setState(() {
    //   alamat.text = 'Lat: ${position.latitude}, Long: ${position.longitude}';
    // });

    // // Salin alamat ke clipboard (opsional)
    // await Clipboard.setData(ClipboardData(text: alamat.text));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Location copied to clipboard'),
      ),
    );
  }

  // Pilih gambar dari galery function
  Future _pilihDariGalery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImages = File(returnedImage.path);
    });
  }

  // Ambil gambar dari kamera
  Future _ambilGambar() async {
    // var status = await Permission.camera.status;
    // if (!status.isGranted) {
    //   await Permission.camera.request();
    // }
    final takePhoto =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (takePhoto == null) return;
    setState(() {
      _selectedImages = File(takePhoto.path);
    });
  }


  // Initialise firestore
  FireStoreDatabase database = FireStoreDatabase();

  // Function simpan data
  void addUserData() async {
    String datanik = nik.text;
    String datanama = nama.text;
    String datanoHp = noHp.text;
    String datatanggal = tanggal.text;
    String datajenisKelamin = dropDownvalue;
    String dataAlamat = alamat.text;
    String? dataImage = _selectedImages?.path;

    database.addDataKPU(datanik, datanama, datanoHp, datatanggal, dataAlamat,
        datajenisKelamin, dataImage);

    Provider.of<DataPenggunaKPU>(context, listen: false)
        .addUserData(widget.dataKPU);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        color: const Color.fromARGB(255, 107, 35, 30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 64, bottom: 24),
                    child: Text(
                      'Form Entry',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 107, 35, 30),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'NIK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFields(
                actionText: 'NIK',
                controller: nik,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFields(
                actionText: 'Masukkan Nama',
                controller: nama,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'No. HP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFields(
                actionText: 'Masukkan No HP.',
                controller: noHp,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Jenis Kelamin',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                   
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DropdownButtonFormField<String>(
                  value: dropDownvalue,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownvalue = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Laki laki',
                      child: Text('Laki laki'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Perempuan',
                      child: Text('Perempuan'),
                    ),
                  ],
                ),
              ),

              // Heading 'tanggal'
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Tanggal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              const SizedBox(height: 12),
              TanggalField(
                actionText: 'Masukkan Tanggal',
                controller: tanggal,
              ),

              // Heading 'alamat'
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Alamat',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //textfield alamatcontroller
              const SizedBox(height: 12),
              AlamatField(
                actionText: 'Masukkan Alamat',
                controller: alamat,
                
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 216),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 107, 35, 30)),
                  onPressed: _getCurrentLocation,
                  child: Text('Baca Lokasi',style: TextStyle(color: Colors.white),),
                ),
              ),

              // Heading 'Gambar'
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Gambar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Button pilih dari gallery
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _pilihDariGalery();
                      },
                      color: const Color.fromARGB(255, 107, 35, 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      child: const Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.photo_size_select_actual_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Galeri',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    MaterialButton(
                      onPressed: () {
                        _ambilGambar();
                      },
                      color: const Color.fromARGB(255, 107, 35, 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Kamera',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Display image
              const SizedBox(height: 24),
              _selectedImages != null
                  ? Image.file(_selectedImages!)
                  : Center(
                      child: const Text(' *Harap Pilih atau Ambil Bukti*')),

              // Save button
              const SizedBox(height: 64),
              SubmitButton(
                actionName: 'Submit Data',
                onTap: () => addUserData(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
