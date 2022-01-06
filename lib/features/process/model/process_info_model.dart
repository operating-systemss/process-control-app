import 'dart:convert';

List<ProcessInfoModel> processInfoModelFromJson(String str) => List<ProcessInfoModel>.from(json.decode(str).map((x) => ProcessInfoModel.fromJson(x)));

String processInfoModelToJson(List<ProcessInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProcessInfoModel {
    ProcessInfoModel({
        this.memory,
        this.cmd,
        this.pid,
        this.name,
        this.uid,
        this.cpu,
        this.ppid,
    });

    var memory;
    String ?cmd;
    int ?pid;
    String ?name;
    int ?uid;
    var cpu;
    int ?ppid;

    factory ProcessInfoModel.fromJson(Map<String, dynamic> json) => ProcessInfoModel(
        memory: json["memory"],
        cmd: json["cmd"],
        pid: json["pid"],
        name: json["name"],
        uid: json["uid"],
        cpu: json["cpu"],
        ppid: json["ppid"],
    );

    Map<String, dynamic> toJson() => {
        "memory": memory,
        "cmd": cmd,
        "pid": pid,
        "name": name,
        "uid": uid,
        "cpu": cpu,
        "ppid": ppid,
    };
}
