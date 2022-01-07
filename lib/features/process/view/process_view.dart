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
  // List<ProcessInfoModel> snapshot.data!.data()['doc'] = [];

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
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
            stream: getProcesses.snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // snapshot.data!.data()['doc'].add(snapshot.data!.data()['doc']);
                snapshot.data!.data();

                // snapshot.data!.data()['doc'] = snapshot.data!.data()['doc'];
                // snapshot.data!.data().forEach((k, v) => snapshot.data!.data()['doc'].add(ProcessInfoModel.fromJson(v)));

                for (var i = 0; i < snapshot.data!.data()['doc'].length; i++) {
                  print(snapshot.data!.data()['doc'][i]['pid'].toString());
                  if (snapshot.data!.data()['doc'][i]['cmd'].toString().contains(RegExp('([.app])\app+'))) {
                    if (snapshot.data!.data()['doc'][i]['cmd'].toString().length > 14) {
                      if (!snapshot.data!
                          .data()['doc'][i]['cmd']
                          .toString()
                          .substring(14, snapshot.data!.data()['doc'][i]['cmd'].toString().indexOf(RegExp('([.app])\app+')))
                          .toString()
                          .contains('/')) {
                        // print(snapshot.data!
                        //     .data()['doc'][i]['cmd']
                        //     .toString()
                        //     .substring(14, snapshot.data!.data()['doc'][i]['cmd'].toString().indexOf(RegExp('([.app])\app+')))
                        //     .toString());
                      }
                    }
                  }
                }
                print('---------------------------------------');
              }
              return !snapshot.hasData
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.data()['doc'].length,
                      itemBuilder: (context, index) {
                        return snapshot.data!.data()['doc'][index]['cmd'].toString().contains(RegExp('([.app])\app+'))
                            ? snapshot.data!.data()['doc'][index]['cmd'].toString().length > 14
                                ? !snapshot.data!
                                        .data()['doc'][index]['cmd']
                                        .toString()
                                        .substring(14, snapshot.data!.data()['doc'][index]['cmd'].toString().indexOf(RegExp('([.app])\app+')))
                                        .toString()
                                        .contains('/')
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(Routes.PROCESS_DETAILS,
                                                arguments: ProcessDetailsModel(
                                                    name: snapshot.data!
                                                        .data()['doc'][index]['cmd']
                                                        .toString()
                                                        .substring(14,
                                                            snapshot.data!.data()['doc'][index]['cmd'].toString().indexOf(RegExp('([.app])\app+')))
                                                        .toString(),
                                                    cpu: snapshot.data!.data()['doc'][index]['cpu'],
                                                    memory: snapshot.data!.data()['doc'][index]['memory'],
                                                    pid: snapshot.data!.data()['doc'][index]['pid'],
                                                    ppid: snapshot.data!.data()['doc'][index]['ppid'],
                                                    uid: snapshot.data!.data()['doc'][index]['uid']));
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
                                            child: Stack(
                                              children: [
                                                !snapshot.data!.data()['doc'][index]['name'].toString().contains('Helper')
                                                    ? Positioned(right: 0, child: Icon(Icons.star))
                                                    : Visibility(
                                                        visible: false,
                                                        child: Text(''),
                                                      ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Name : ' + snapshot.data!.data()['doc'][index]['name'].toString(),
                                                      style: const TextStyle(fontSize: 18),
                                                    ),
                                                    Text(
                                                      'CPU : ' + snapshot.data!.data()['doc'][index]['cpu'].toString(),
                                                      style: TextStyle(fontSize: 18),
                                                    ),
                                                    Text(
                                                      'Memory : ' + snapshot.data!.data()['doc'][index]['memory'].toString(),
                                                      style: TextStyle(fontSize: 18),
                                                    ),
                                                  ],
                                                ),
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
      ),
    );
  }
}
