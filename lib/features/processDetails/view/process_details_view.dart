import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:system_monitor/features/processDetails/controller/process_details_controller.dart';
import 'package:http/http.dart' as http;

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
                    Text(
                      'Memory : ' + processDetailsController.arguments.memory.toString(),
                      style: const TextStyle(fontSize: 23),
                    ),
                    buildSizedBox(),
                    buildGaugeChart(processDetailsController.arguments.cpu.toString(), context),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () async {
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

  Widget buildGaugeChart(String cpuValue, BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 2.2,
      child: Stack(
        children: [
          SfRadialGauge(enableLoadingAnimation: true, animationDuration: 3000, axes: <RadialAxis>[
            RadialAxis(
                radiusFactor: 0.90,
                tickOffset: 10,
                minimum: 0,
                maximum: 100,
                useRangeColorForAxis: true,
                showTicks: false,
                showLabels: false,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 100,
                    startWidth: 40,
                    endWidth: 40,
                    gradient: const SweepGradient(colors: <Color>[
                      Colors.green,
                      Colors.red,
                    ], stops: <double>[
                      0.10,
                      1.00
                    ]),
                  )
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    knobStyle: KnobStyle(color: Colors.black),
                    needleLength: 0.5,
                    needleStartWidth: 0.2,
                    needleEndWidth: 6,
                    needleColor: Colors.black,
                    enableAnimation: true,
                    animationDuration: 1500,
                    value: double.parse(cpuValue.toString()),
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget:
                        Text('  CPU\n%' + '$cpuValue' + '\n\n\n', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                    verticalAlignment: GaugeAlignment.near,
                    angle: 90,
                    positionFactor: 0.6,
                    axisValue: -0.5,
                  )
                ]
                //
                )
          ]),
        ],
      ),
    );
  }
}
