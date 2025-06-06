import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pamlanjut_restapi/data/model/request/buyer/buyer_profile_request_model.dart';
import 'package:pamlanjut_restapi/data/model/response/buyer/buyer_profile_response_model.dart';
import 'package:pamlanjut_restapi/service/service_http_client.dart';

class ProfileBuyerRepository {
  final ServiceHttpClient _serviceHttpClient;

  ProfileBuyerRepository(this._serviceHttpClient);

  Future<Either<String, BuyerProfileResponseModel>> addProfileBuyer(
    BuyerProfileRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        "buyer/profile",
        requestModel.toMap(),
      );
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = BuyerProfileResponseModel.fromJson(jsonResponse);
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? "Unknown error occured");
      }
    } catch (e) {
      return Left("An error occured while adding profile: $e");
    }
  }
}