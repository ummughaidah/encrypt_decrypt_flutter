import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  var token = ''.obs;
  var isTokenExpired = false.obs;

  void validateToken(String jwt, String secretKey) {
    try {
      final jwtToken = JWT.verify(jwt, SecretKey(secretKey));
      final expTimestamp = jwtToken.payload['exp'] as int?;

      if (expTimestamp != null) {
        final expirationDate =
            DateTime.fromMillisecondsSinceEpoch(expTimestamp * 1000);
        if (DateTime.now().isAfter(expirationDate)) {
          isTokenExpired.value = true;
        } else {
          isTokenExpired.value = false;
        }
      } else {
        isTokenExpired.value = true; // Jika tidak ada 'exp', anggap kadaluarsa
      }
    } catch (e) {
      isTokenExpired.value =
          true; // Jika terjadi error, anggap token kadaluarsa
    }
  }

  void updateToken(String newToken, String secretKey) {
    token.value = newToken;
    validateToken(newToken, secretKey);
  }
}
