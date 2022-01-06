import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_monitor/core/constants/app/app_pages_name.dart';
import 'package:system_monitor/features/process/model/process_info_model.dart';
import 'package:system_monitor/features/processDetails/model/process_details_model.dart';

class ProcessView extends StatefulWidget {
  ProcessView({Key? key}) : super(key: key);

  @override
  State<ProcessView> createState() => _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // late ProcessInfoModel processInfoModel;
  // List<ProcessInfoModel> processList = [];
  // List<String> processNameList = [];
  DocumentReference get getProcesses => firebaseFirestore.collection('data').doc('process');
  List<ProcessInfoModel> processModelList = [];

  @override
  void initState() {
    //getData();
    super.initState();
  }

  // Future<void> getData() async {
  //   var ref = await firebaseFirestore.collection('data').doc('process').get();
  //   List list = [];
  //   ref.data()!.forEach((key, value) {
  //     list.add(value);
  //     if (ProcessInfoModel.fromJson(value).cmd!.contains(RegExp('([.app])\app+'))) {
  //       processList.add(ProcessInfoModel.fromJson(value));
  //     }
  //   });
  //   for (var i = 0; i < processList.length; i++) {
  //     if (!processList[i].cmd!.substring(14, processList[i].cmd!.indexOf(RegExp('([.app])\app+'))).contains('/')) {
  //       processNameList.add(processList[i].cmd!.substring(14, processList[i].cmd!.indexOf(RegExp('([.app])\app+'))).toString());
  //     }
  //   }
  //   print(processNameList);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Process Informations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: getProcesses.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              processModelList.add(ProcessInfoModel.fromJson(snapshot.data!.data()));
              snapshot.data!.data();
              snapshot.data!.data().forEach((k, v) => processModelList.add(ProcessInfoModel.fromJson(v)));
            }
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.data().length,
                    itemBuilder: (context, index) {
                      return processModelList[index].cmd.toString().contains(RegExp('([.app])\app+'))
                          ? processModelList[index].cmd.toString().length > 14
                              ? !processModelList[index]
                                      .cmd
                                      .toString()
                                      .substring(14, processModelList[index].cmd.toString().indexOf(RegExp('([.app])\app+')))
                                      .toString()
                                      .contains('/')
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.PROCESS_DETAILS,
                                              arguments: ProcessDetailsModel(
                                                  name: processModelList[index]
                                                      .cmd
                                                      .toString()
                                                      .substring(14, processModelList[index].cmd.toString().indexOf(RegExp('([.app])\app+')))
                                                      .toString(),
                                                  cpu: processModelList[index].cpu,
                                                  memory: processModelList[index].memory,
                                                  pid: processModelList[index].pid,
                                                  ppid: processModelList[index].ppid,
                                                  uid: processModelList[index].uid));
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'İsim : ' +
                                                    processModelList[index]
                                                        .cmd
                                                        .toString()
                                                        .substring(14, processModelList[index].cmd.toString().indexOf(RegExp('([.app])\app+')))
                                                        .toString(),
                                                style: const TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                'CPU : ' + processModelList[index].cpu.toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                'Memory : ' + processModelList[index].memory.toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              // Text(
                                              //   'PID : ' + processModelList[index].pid.toString(),
                                              //   style: TextStyle(fontSize: 18),
                                              // ),
                                              // Text(
                                              //   'PPID : ' + processModelList[index].ppid.toString(),
                                              //   style: TextStyle(fontSize: 18),
                                              // ),
                                              // Text(
                                              //   'UID : ' + processModelList[index].uid.toString(),
                                              //   style: TextStyle(fontSize: 18),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Visibility(visible: false, child: Text(''))
                              : Visibility(visible: false, child: Text(''))
                          : Visibility(visible: false, child: Text(''));
                    });
          }),
    );
  }
}
