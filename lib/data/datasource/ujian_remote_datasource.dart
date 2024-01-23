import 'package:dartz/dartz.dart';
import 'package:flutter_cbt_tpa_app/core/constants/variables.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_cbt_tpa_app/data/models/responses/ujian_response_model.dart';
import 'package:http/http.dart' as http;

class UjianRemoteDatasource {
  Future<Either<String, UjianResponseModel>> getUjianByKategori(
      String kategori) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/get-soal-ujian?kategori=$kategori'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authData.accessToken}',
        });

    if (response.statusCode == 200) {
      return Right(UjianResponseModel.fromJson(response.body));
    } else {
      return const Left('get ujian gagal');
    }
  }

  Future<Either<String, String>> createUjian() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/create-ujian'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authData.accessToken}',
        });

    if (response.statusCode == 200) {
      return const Right('create ujian berhasil');
    } else {
      return const Left('get ujian gagal');
    }
  }
}
