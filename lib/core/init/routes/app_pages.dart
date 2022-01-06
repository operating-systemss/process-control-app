import 'package:get/route_manager.dart';
import 'package:system_monitor/features/process/view/process_view.dart';
import 'package:system_monitor/features/processDetails/view/process_details_view.dart';

import '../../constants/app/app_pages_name.dart';

class AppPages {
  static final appPages = [
    GetPage(name: Routes.INIT, page: () => ProcessView()),
    GetPage(name: Routes.PROCESS_DETAILS, page: () => ProcessDetailsView()),
  ];
}
