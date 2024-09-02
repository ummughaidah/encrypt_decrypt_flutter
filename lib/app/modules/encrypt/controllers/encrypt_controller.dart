import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mobile_security/app/data/service/my_encryption.dart';

class EncryptController extends GetxController {
  TextEditingController? controllerText;
  var plainText = ''.obs;
  var encryptedText = ''.obs;
  var decryptedText = ''.obs;

  // fungsi untuk menampilkan string enkripsi text
  void encryptText(text) {
    plainText.value = text;
    final encrypted = MyEncription.encryptAES(text);
    encryptedText.value = encrypted.base64;
  }

  // untuk menampilkan fungsi deskripsi dengan menampilkan chipertext dan mengembalikan plaintext asli
  void decryptText() {
    decryptedText.value = MyEncription.decryptAES(encryptedText.value);
  }

  @override
  void onInit() {
    super.onInit();
    controllerText = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    controllerText?.dispose();
  }
}
