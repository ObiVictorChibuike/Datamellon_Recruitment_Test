import 'package:datamellon_recruitment_test/app/constants/http_status.dart';
import 'package:datamellon_recruitment_test/app/constants/strings.dart';
import 'package:datamellon_recruitment_test/core/use_cases/use_cases.dart';
import 'package:datamellon_recruitment_test/data/model/safe_data_response_model.dart';
import 'package:datamellon_recruitment_test/data/repository/safe_data_repository/safe_data_repository.dart';
import 'package:datamellon_recruitment_test/domain/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:datamellon_recruitment_test/domain/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class SafeDataRepositoryImpl implements noParamUseCases<DataState<List<SafeDataList>>> {
  final SafeDataRepository _safeDataRepository;

  SafeDataRepositoryImpl(this._safeDataRepository);

  @override
  Future<DataState<List<SafeDataList>>> noParamCall() async{
    try {
      final response = await _safeDataRepository.getSafaData();
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {
        final data = response.data as List<dynamic>;
        final safeDataList = List<SafeDataList>.from(
            data.map((item) => SafeDataList.fromJson(item)));
        return DataSuccess(safeDataList);
      }
      return DataFailed(response.statusMessage);
    } on DioError catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      if (kDebugMode) {
        print(errorMessage);
      }
      return DataFailed(err.response?.data[Strings.error] ?? errorMessage);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return DataFailed(err.toString());
    }
  }
}