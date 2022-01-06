import 'dart:convert';
import 'package:http/http.dart' as http;
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
    // changePasswordShow();
    // try {
    //   await Dio().delete('http://localhost:3000/process/' + processId);
    //   print('ciwan mk');
    //   Get.back();
    //   // changePasswordShow();

    //   return Get.back();
    // } catch (e) {
    //   changePasswordShow();
    //   throw Exception(e);
    // }

    var url = Uri.parse('http://localhost:3000/process/' + processId);
    var response = await http.delete(url).then((value) {
      print('object');
    });
    print('Response status: ${response.statusCode}');

    print('Response body: ${response.body}');
  }
}
