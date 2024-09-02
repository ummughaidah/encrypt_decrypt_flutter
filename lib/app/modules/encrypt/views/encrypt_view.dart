import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/encrypt_controller.dart';

class EncryptView extends GetView<EncryptController> {
  const EncryptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EncryptController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encrypt/Decrypt'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // input text untuk proses enkripsi dan deskripsi data
              TextField(
                controller: controller.controllerText,
                decoration: const InputDecoration(labelText: 'Masukan Text'),
              ),
              const SizedBox(height: 10),
              // untuk menampilkan plain text
              const Text(
                'Plaintext : ',
                style: TextStyle(fontSize: 20),
              ),
              Obx(() => Text(
                    controller.plainText.value,
                    style: const TextStyle(fontSize: 20),
                  )),
              const Text(
                '-----------------------------------',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              // untuk menampilkan string Encryption Text / Chipertext
              const Text(
                'Encryption Text / Chipertext : ',
                style: TextStyle(fontSize: 20),
              ),
              Obx(() => Text(
                    controller.encryptedText.value,
                    style: const TextStyle(fontSize: 20),
                  )),
              const Text(
                '-----------------------------------',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              // untuk menampilkan fungsi deskripsi dengan mengembalikan plaintext asli
              const Text(
                'Decryption Text : ',
                style: TextStyle(fontSize: 20),
              ),
              Obx(() => Text(
                    controller.decryptedText.value,
                    style: const TextStyle(fontSize: 20),
                  )),
              const Text(
                '-----------------------------------',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // button untuk menghasilkan plain text dan enkripsi text
                  ElevatedButton(
                      onPressed: () {
                        controller.encryptText(controller.controllerText!.text);
                      },
                      child: const Text('Encryption')),
                  const SizedBox(width: 5),
                  // button untuk menampilkan fungsi deskripsi dengan mengembalikan plaintext asli
                  ElevatedButton(
                      onPressed: () {
                        controller.decryptText();
                      },
                      child: const Text('Decryption')),
                ],
              )
            ],
          )),
    );
  }
}
