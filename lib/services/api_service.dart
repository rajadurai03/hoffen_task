import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:convert';
import '/utils/constant_utils.dart';
import '/utils/pref_manager.dart';

class ApiRequest {
  final String url;
  Map<String, dynamic>? params;
  var formdataParams;

  ApiRequest({required this.url, this.params, this.formdataParams});

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(

        responseType: ResponseType.json,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000 // 60 seconds

        ));
  }

  Future<void> get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    print('GET METHOD DATA  URLS :- $url \n PARAMS :- $params');
    _dio().get(this.url, queryParameters: params).then((res) {
      print('API SERIVE ${res}');
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      print('ERROR OF API ${error}');
      if (onError != null) onError(_handleError(error));
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    print(' POST METHOD  DATA  URLS :- $url \n PARAMS :- $formdataParams');
    _dio().post(this.url, data: (this.formdataParams),).then((res) {

      print(res);
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      print('ERROR VALUE $error');
      if (onError != null) onError(_handleError(error));
    });
  }

  void postWithfile({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    print(
        ' POST METHOD WITH FILE  DATA  URLS :- $url \n PARAMS :- $formdataParams');
    _dio().post(this.url, data: this.formdataParams,
      onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + '%');
        }
      },).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      print('ERROR VALUE $error');
      if (onError != null) onError(_handleError(error));
    });
  }

  void getWithfile({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    print(
        ' GET METHOD WITH FILE  DATA  URLS :- $url \n PARAMS :- $formdataParams');
    print(
        ' GET METHOD WITH FILE  DATA  URLS :- $url \n PARAMS :- $formdataParams');

    _dio()
        .get(
      this.url,
    )
        .then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      print('ERROR VALUE $error');
      if (onError != null) onError(_handleError(error));
    });
  }
}

String _handleError(DioError error) {
  String? errorDescription = "";

  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.other:
      errorDescription =
          "Connection to API server failed due to internet connection";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.response:
      errorDescription =
          "Error : ${error.response!.statusCode} - ${error.response!.statusMessage}";

      


      break;
    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
  }
  return errorDescription;
}
