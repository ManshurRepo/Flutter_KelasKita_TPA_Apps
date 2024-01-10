import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:flutter_cbt_tpa_app/core/constants/variables.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_cbt_tpa_app/data/models/requests/login_request_model.dart';
import 'package:flutter_cbt_tpa_app/data/models/requests/register_request_model.dart';
import 'package:flutter_cbt_tpa_app/data/models/responses/auth_response_model.dart';
import 'package:flutter_cbt_tpa_app/data/models/responses/register_response_model.dart';

import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      return const Left('register gagal');
    }
  }

  // function for logout
  // Future<Either<String, String>> logout() async {
  //   final authData = await AuthLocalDatasource().getAuthData();
  //   final response = await http.post(
  //     Uri.parse('${Variables.baseUrl}/api/logout'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer ${authData.accesToken}',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return const Right('logout berhasil');
  //   } else {
  //     return const Left('logout gagal');
  //   }
  // }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return const Right('logout berhasil');
    } else {
      return const Left('logout gagal');
    }
  }

  // function for login
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final response =
        await http.post(Uri.parse('${Variables.baseUrl}/api/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: data.toJson());

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('login gagal');
    }
  }
}
