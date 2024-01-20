import 'package:dartz/dartz.dart';
import 'package:flutter_cbt_tpa_app/core/constants/variables.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

import '../models/responses/materi_response_model.dart';

class MateriRemoteDatasource {
  //get content by id
  Future<Either<String, MateriResponseModel>> getAllMateri() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/materis'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(MateriResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }
}
