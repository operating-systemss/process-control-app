import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:system_monitor/features/processDetails/controller/process_details_controller.dart';

class ProcessDetailsView extends StatelessWidget {
  ProcessDetailsView({
    Key? key,
  }) : super(key: key);
  final ProcessDetailsController processDetailsController = Get.put(ProcessDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Process Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => processDetailsController.isClosedProgram
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name : ' + processDetailsController.arguments.name.toString(),
                      style: const TextStyle(fontSize: 23),
                    ),
                    buildSizedBox(),
                    Text(
                      'PID : ' + processDetailsController.arguments.pid.toString(),
                      style: const TextStyle(fontSize: 23),
                    ),
                    buildSizedBox(),
                    Text(
                      'PPID : ' + processDetailsController.arguments.ppid.toString(),
                      style: const TextStyle(fontSize: 23),
                    ),
                    buildSizedBox(),
                    Text(
                      'UID : ' + processDetailsController.arguments.uid.toString(),
                      style: const TextStyle(fontSize: 23),
                    ),
                    buildSizedBox(),
                    PieChart(
                      dataMap: {
                        'CPU': double.parse(processDetailsController.arguments.cpu.toString()),
                        'Memory': double.parse(processDetailsController.arguments.memory.toString()),
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          processDetailsController.closeProgram(processDetailsController.arguments.pid.toString());
                        },
                        child: const Text(
                          'Close Program',
                          style: TextStyle(fontSize: 23),
                        ))
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Column buildSizedBox() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
