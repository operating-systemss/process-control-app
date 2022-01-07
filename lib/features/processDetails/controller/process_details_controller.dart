import 'package:http/http.dart' as http;
import 'package:get/get.dart';
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
    var url = Uri.parse('http://localhost:3000/process/' + processId);
    Get.back();
    await http.delete(url);
  }
}
