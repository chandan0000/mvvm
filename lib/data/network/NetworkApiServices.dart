import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm/data/app_exe.dart';
import 'package:mvvm/data/network/Base_Api_Services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future geGetResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExeception(' No internet connection');
    }
    return responseJson;
  }
  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExeception(' No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExeception(response.body.toString());
      case 404:
        throw UnauthorisedExeception(response.body.toString());

      default:
        throw FetchDataExeception(
            'Error accured whic communicating wiht servver' +
                'whi status code ' +
                response.statusCode.toString());
    }
  }
}
