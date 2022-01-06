import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:system_monitor/features/processDetails/model/process_details_model.dart';

class ProcessDetailsController extends GetxController {
  final ProcessDetailsModel arguments = Get.arguments;

  final _isClosedProgram = true.obs;
  bool get isClosedProgram => _isClosedProgram.value;
  set isClosedProgram(bool isClosedProgram) => _isClosedProgram.value = isClosedProgram;
  void changePasswordShow() {
    isClosedProgram = !isClosedProgram;
  }

  Future<void> closeProgram(String processId) async {
    changePasswordShow();
    try {
      final response = await Dio().delete(
        'http://localhost:3000/process/'+processId,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
          changePasswordShow();
          return response.data;
        default:
          changePasswordShow();
          return print(response.statusMessage.toString());
      }
    } catch (e) {
      changePasswordShow();
      throw Exception(e);
    }
  }
}
