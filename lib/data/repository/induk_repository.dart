import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pamlanjut_restapi/data/model/request/admin/induk_request_model.dart';
import 'package:pamlanjut_restapi/data/model/response/get_all_induk_response.dart';
import 'package:pamlanjut_restapi/service/service_http_client.dart';

class IndukRepository {
  final ServiceHttpClient _serviceHttpClient;

  IndukRepository(this._serviceHttpClient);

  Future<Either<String, GetIndukById>> addInduk(
    IndukRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        "admin/induk",
        requestModel.toMap(),
      );

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = GetIndukById.fromJson(jsonResponse);
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occured');
      }
    } catch (e) {
      return Left("An error occured while adding induk: $e");
    }
  }
}