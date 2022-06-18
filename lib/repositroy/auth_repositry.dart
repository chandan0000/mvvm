import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/network/Base_Api_Services.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/resource/app_url.dart';
import 'package:mvvm/utils/utils.dart';

class AuthRespository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
