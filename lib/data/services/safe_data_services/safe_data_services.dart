import 'package:datamellon_recruitment_test/domain/remote/network_servcises/dio_service_config/dio_client.dart';
import 'package:dio/dio.dart';
import 'dart:convert';


class SafeDataServices{
  Future<Response?> getSafaData() async {
    var postBody = jsonEncode({
      "angular_test": "angular-developer"
    });
    final response = await NetworkProvider().call(path: "/DEV/stub", method: RequestMethod.post, body: postBody,);
    return response;
  }
}