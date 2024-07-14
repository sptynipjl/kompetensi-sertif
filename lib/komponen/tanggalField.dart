import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TanggalField extends StatelessWidget {
  final String actionText;
  final controller;

  const TanggalField({
    super.key,
    required this.actionText,
    required this.controller,
  });

  Future<void> _pilihTgl(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              readOnly: true,
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 24),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 107, 35, 30)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: actionText,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  )),
              onTap: () {
        _pilihTgl(context);
      },
            ),
          ),
        ],
      ),
    );
  }
}
