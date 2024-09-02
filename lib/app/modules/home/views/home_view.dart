import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_mobile_security/app/modules/encrypt/views/encrypt_view.dart';
import 'package:test_mobile_security/app/modules/token/views/token_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => const EncryptView());
              },
              child: const Text('Encrypt/Decrypt')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const TokenView());
              },
              child: const Text('Token JWT'))
        ],
      )),
    );
  }
}
