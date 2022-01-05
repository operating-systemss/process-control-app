import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:system_monitor/features/process/model/process_info_model.dart';

class ProcessView extends StatefulWidget {
  ProcessView({Key? key}) : super(key: key);

  @override
  State<ProcessView> createState() => _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late ProcessInfoModel processInfoModel;
  List<ProcessInfoModel> processList = [];
  List<String> processNameList = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    var ref = await firebaseFirestore.collection('data').doc('process').get();
    List list = [];
    ref.data()!.forEach((key, value) {
      list.add(value);
      if (ProcessInfoModel.fromJson(value).cmd!.contains(RegExp('([.app])\app+'))) {
        processList.add(ProcessInfoModel.fromJson(value));
      }
    });
    for (var i = 0; i < processList.length; i++) {
      if (!processList[i].cmd!.substring(14, processList[i].cmd!.indexOf(RegExp('([.app])\app+'))).contains('/')) {
        processNameList.add(processList[i].cmd!.substring(14, processList[i].cmd!.indexOf(RegExp('([.app])\app+'))).toString());
      }
    }
    print(processNameList);
  }

  DocumentReference get getProcesses => firebaseFirestore.collection('data').doc('process');
  List ass = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
            onPressed: () {
              getData();
            },
            child: Text('GET')),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: getProcesses.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              ass.add(snapshot.data!.data());
              snapshot.data!.data();
              snapshot.data!.data().forEach((k, v) => ass.add(v));

              // print(ass);

            }
            return !snapshot.hasData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.data().length,
                    itemBuilder: (context, index) {
                      //processList[i].cmd!.substring(14, processList[i].cmd!.indexOf(RegExp('([.app])\app+')))
                      return Text(ass[index]['cmd'].toString().length > 14
                          ? ass[index]['cmd'].toString().substring(14, ass[index]['cmd'].toString().indexOf(RegExp('([.app])\app+'))).toString()
                          : '');
                    });
          }),
    );
  }
}
