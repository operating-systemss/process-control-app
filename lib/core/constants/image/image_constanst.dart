class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= _instance = ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String get mercedes => getPng('mercedes-e-klasse');
  String get mercedesVito => getPng('mercedes-vito');
  String get vehicleFleet1 => getJpeg('vehicle_fleet_1');
  String get vehicleFleet2 => getJpeg('vehicle_fleet_2');
  String get vehicleFleet3 => getJpeg('vehicle_fleet_3');
  String get vehicleFleet4 => getJpeg('vehicle_fleet_4');
  String get vehicleFleet5 => getJpeg('vehicle_fleet_5');
  String get vehicleFleet6 => getJpeg('vehicle_fleet_6');

  String get categoryPhoto1 => getJpeg('1');
  String get categoryPhoto2 => getJpeg('2');
  String get categoryPhoto3 => getJpeg('3');
  String get categoryPhoto4 => getJpeg('4');
  String get categoryPhoto5 => getJpeg('5');
  String get categoryPhoto6 => getJpeg('6');

  String get vipCar => getPng('vip_car');

  String get splashLogo => getPng('splasLogo');

  String getPng(value) => 'assets/image/$value.png';
  String getJpeg(value) => 'assets/image/$value.jpeg';
}
