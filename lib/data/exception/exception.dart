import 'package:base_constructor/config/r.dart';

class CustomException implements Exception {
  int statusCode;
  String message;

  String toString() => (message ?? "").toString();

  CustomException([this.statusCode, this.message]);
}


class NetworkException implements Exception {
  int statusCode;
  String message;

  String toString() => (message ?? "").toString();

  NetworkException([this.statusCode, this.message]) {
    R.notification.translate();

    if(this.message.contains('SocketException'))
      this.message = "Kết nối máy chủ thất bại.\nVui lòng kiểm tra kết nối mạng !";
  }
}