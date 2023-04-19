import 'package:datamellon_recruitment_test/app/shared/widget/constant.dart';
import 'package:datamellon_recruitment_test/core/state/view_state.dart';
import 'package:datamellon_recruitment_test/data/model/safe_data_response_model.dart';
import 'package:datamellon_recruitment_test/data/repository/safe_data_repository/safe_data_repository.dart';
import 'package:datamellon_recruitment_test/data/services/safe_data_services/safe_data_services.dart';
import 'package:datamellon_recruitment_test/domain/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:datamellon_recruitment_test/domain/repository/safe_data_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  ///Dependency injection
  final getSafeData = Get.put(SafeDataRepositoryImpl(SafeDataRepository(SafeDataServices())));

  ///Variables
  String? errorMessage;

  ///Initialize State
  ViewState<List<SafeDataList>> viewState = ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState<List<SafeDataList>> viewState) {
    this.viewState = viewState;
  }

  ///List of popup menu widget initialization
  List<PopupMenuItem> filterOptions = Constants.popUp;

  /// function to call the api. Returns he safe data list
  Future<void> getSafeDataList()async{
    _setViewState(ViewState.loading());
    await getSafeData.noParamCall().then((value) async {
      if(value is DataSuccess || value.data != null) {
        _setViewState(ViewState.complete(value.data!));
        update();
      }
      if (value is DataFailed || value.data == null) {
        if (kDebugMode) {
          print(value.error.toString());
        }
        errorMessage = value.error.toString();
        _setViewState(ViewState.error(value.error.toString()));
        update();
      }}
    );
  }


  ///Init state of the controller
  @override
  void onInit() {
    getSafeDataList();
    super.onInit();
  }
}