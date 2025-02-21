import 'dart:convert';
import 'package:dart_des/dart_des.dart';

var key = "38346591";
DES des = DES(key: key.codeUnits, mode: DESMode.ECB);
String decrypt(String encdata, String quality) {
  List<int> decrypted = des.decrypt(base64.decode(encdata));
  return (utf8.decode(decrypted).toString().replaceAll("_96", quality));
}