import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncription {
  // inisialisasi fungsi untuk melakukan enkripsi data
  static final key = encrypt.Key.fromLength(16);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }
  
  // fungsi deskripsi dengan menampilkan chipertext dan mengembalikan plaintext asli
  static decryptAES(text) {
    final decrypted = encrypter.decrypt64(text, iv: iv);
    print(decrypted);
    return decrypted;
  }
}
