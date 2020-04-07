export 'package:dio/dio.dart';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {

  final String BASE_PATH = "http://retail_api.posapp.vn/api/";

  final String CUSTOMER_PATH = "getListCustomer";

  Dio dio;

  BaseService(){
    dio = Dio(BaseOptions(
    baseUrl: BASE_PATH,
    connectTimeout: 15000,
    receiveTimeout: 15000,
    responseType: ResponseType.json));
  }


  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
          "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  bool responseSuccess(var response) {
    return response.data["status"] == 1 && response.data["error_code"] == 0;
  }
}
