import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/token_controller.dart';

class TokenView extends GetView<TokenController> {
  const TokenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TokenController());
    final secretKeyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Token JWT'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                controller.updateToken(value, secretKeyController.text);
              },
              decoration: const InputDecoration(labelText: 'Enter JWT'),
            ),
            TextField(
              controller: secretKeyController,
              decoration: const InputDecoration(labelText: 'Enter Secret Key'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  controller.isTokenExpired.value
                      ? 'Token is expired or invalid'
                      : 'Token is valid',
                  style: TextStyle(
                    color: controller.isTokenExpired.value
                        ? Colors.red
                        : Colors.green,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
