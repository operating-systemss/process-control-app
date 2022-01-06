class ProcessDetailsModel {
  String? name;
  var cpu, memory;
  int? pid, ppid, uid;
  ProcessDetailsModel({
    required this.name,required this.cpu,required this.memory,required this.pid,required this.ppid, required this.uid});
}
