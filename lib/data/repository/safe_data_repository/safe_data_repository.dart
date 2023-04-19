import 'package:datamellon_recruitment_test/data/services/safe_data_services/safe_data_services.dart';
import 'package:dio/dio.dart';

class SafeDataRepository{
  final SafeDataServices _safeDataServices;
  SafeDataRepository(this._safeDataServices);

  Future<Response?> getSafaData() => _safeDataServices.getSafaData();

}