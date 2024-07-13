import 'package:flutter/material.dart';
// import 'package:sisfo_kpu/data/Data_KPU.dart';

class DataUserCard extends StatefulWidget {
  final String nik;
  final String nama;
  final String noHp;
  final String tanggal;
  final String jenisKelamin;
  final String alamat;

  const DataUserCard({
    super.key,
    required this.nik,
    required this.nama,
    required this.noHp,
    required this.tanggal,
    required this.jenisKelamin,
    required this.alamat,
  });

  @override
  State<DataUserCard> createState() => _DataUserCardState();
}

class _DataUserCardState extends State<DataUserCard> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Color(hexColor('5B9BBE')),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                widget.nama,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(hexColor('FFFFFF')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          'NIK',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(hexColor('FFFFFF')),
                          ),
                        ),
                        const SizedBox(height: 8, width: 45),
                        Text(
                          ': ${widget.nik}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(hexColor('FFFFFF')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Text(
                          'No.HP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(hexColor('FFFFFF')),
                          ),
                        ),
                        const SizedBox(height: 8, width: 26),
                        Text(
                          ': ${widget.noHp}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(hexColor('FFFFFF')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Text(
                          'Jenis K',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(hexColor('FFFFFF')),
                          ),
                        ),
                        const SizedBox(height: 8, width: 20),
                        Text(
                          ': ${widget.jenisKelamin}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(hexColor('FFFFFF')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alamat',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(hexColor('FFFFFF')),
                          ),
                        ),
                        const SizedBox(height: 8, width: 22),
                        Expanded(
                          child: Wrap(
                            children: [Text(
                              ': ${widget.alamat}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(hexColor('FFFFFF')),
                              ),
                            ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
