import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rilac_split_payment/api_repository/model/request/GetAmlRequestBody.dart';
import 'package:rilac_split_payment/api_repository/model/request/TransactionResultBody.dart';
import 'package:rilac_split_payment/api_repository/model/request/TransferBody.dart';
import 'package:rilac_split_payment/api_repository/model/response/GetAmlResponseModel.dart';
import 'package:rilac_split_payment/api_repository/model/response/TransactionResultResponse.dart';
import 'package:rilac_split_payment/api_repository/model/response/TransferResponse.dart';
import 'package:rilac_split_payment/api_services/api_url.dart';
import 'package:rilac_split_payment/api_services/dio_client.dart';
import 'package:rilac_split_payment/api_services/dio_exceptions.dart';
import 'package:rilac_split_payment/global/global_variable.dart';

class ApiRepository{

  Future<GetAmlResponseModel> getAmlCheck(GetAmlRequestBody getAmlBody) async {
    try {
      Response response = await DioClient().dio.post(ApiUrl.getAmlUrl,
          data: getAmlBody.toJson(),
          options: Options(
            headers: {
              'Module': globalModuleKey,
              'Authorization': globalAccessToken,
              'Content-Type': 'application/json',
            },
          ));
      return GetAmlResponseModel.fromJson(response.data);
    } catch (e) {
      var errorMessage = e.toString();
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      }
      debugPrint(errorMessage);
      return GetAmlResponseModel(responseCode: null, responseDescription: errorMessage);
    }
  }


  Future<TransferResponse> transfer(TransferBody transferBody) async {
    try {
      Response response = await DioClient().dio.post(ApiUrl.transferUrl,
          data: transferBody.toJson(),
          options: Options(
            headers: {
              'Module': globalModuleKey,
              'Authorization': globalAccessToken,
              'Content-Type': 'application/json',
            },
          ));
      return TransferResponse.fromJson(response.data);
    } catch (e) {
      var errorMessage = e.toString();
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      }
      debugPrint(errorMessage);
      return TransferResponse(responseDescription: errorMessage, message: errorMessage);
    }
  }

  Future<TransactionResultResponse> getTransactionResult(TransactionResultBody transactionResultBody) async {
    try {
      Response response =
      await DioClient().dio.post(ApiUrl.getTransactionResultUrl,
          data: transactionResultBody.toJson(),
          options: Options(
            headers: {
              'Module': globalModuleKey,
              'Authorization': globalAccessToken,
              'Content-Type': 'application/json',
            },
          ));
      return TransactionResultResponse.fromJson(response.data);
    } catch (e) {
      var errorMessage = e.toString();
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      }
      debugPrint(errorMessage);
      return TransactionResultResponse(responseDescription: errorMessage, message: errorMessage);
    }
  }

}