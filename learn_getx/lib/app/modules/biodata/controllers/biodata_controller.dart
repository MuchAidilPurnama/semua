import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BiodataController extends GetxController {
  var nama = ''.obs;
  var tanggallahir = ''.obs;
  var agama = ''.obs;
  var jeniskelamin = ''.obs;
  var alamat = ''.obs;
  final List<String> hobiList = [
    'Menari',
    'Membaca',
    'Bernyanyi',
    'Berenang',
    'Sepak Bola',
  ];
  var hobi = <String>[].obs;
  List<String> getHobiist() => hobiList;

  var isFormSubmitted = false.obs;
  var selectedDate = ''.obs;


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedDate.value = formattedDate; //simpan tanggal yang di pilih
    }
  }

  void toggleHobi(String hobiValue) {
    if (hobi.contains(hobiValue)) {
      hobi.remove(hobiValue);
    } else {
      hobi.add(hobiValue);
    }
  }

  void submitFrom() {
    print(
        'Data formulir : ${nama}, ${tanggallahir}, ${agama}, ${jeniskelamin}, ${alamat}, ${hobi.value}');
    isFormSubmitted.value = true;
  }
}
