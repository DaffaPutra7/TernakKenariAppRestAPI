import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pamlanjut_restapi/data/model/request/admin/admin_profile_request_model.dart';
import 'package:pamlanjut_restapi/data/model/response/admin_profile_response_model.dart';
import 'package:pamlanjut_restapi/service/service_http_client.dart';

class ProfilAdminRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = FlutterSecureStorage();

  ProfilAdminRepository(this._serviceHttpClient);

  Future<Either<String, AdminProfileResponseModel>> addProfile(
    AdminProfileRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'admin/profile',
        requestModel.toMap(),
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201) {
        final profileResponse = AdminProfileResponseModel.fromMap(jsonResponse);
        log("Add Admin Profile successful: ${profileResponse.message}");
        return Right(profileResponse);
      } else {
        log("Add Admin Profile failed: ${jsonResponse['message']}");
        return Left(jsonResponse['message'] ?? "Create Prifle failed");
      }
    } catch (e) {
      log("Error in adding profile: $e");
      return Left("An error occured while adding profile: $e");
    }
  }
}