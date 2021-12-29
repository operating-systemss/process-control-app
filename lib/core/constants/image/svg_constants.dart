class SvgConstants {
  static SvgConstants? _instance;
  static SvgConstants get instance {
    _instance ??= _instance = SvgConstants._init();
    return _instance!;
  }

  SvgConstants._init();

  String get onBoardFirst => getSvg('onboard1');
  String get onBoardSecond => getSvg('onboard2');
  String get onBoardThird => getSvg('onboard3');
  String get loginSvg => getSvg('login');
  String get registerSvg => getSvg('register');
  String get splashCar => getSvg('splashCar');
  String get splashLogo => getSvg('splashLogo');
  String get booking => getSvg('booking');
  String get airport => getSvg('airport');
  String get aircraft => getSvg('aircraft');
  String get discount => getSvg('discount');
  String get price => getSvg('price');
  String get notFound => getSvg('404');
  String get vehiclFleet => getSvg('vehicleFleet');

  String getSvg(String value) => 'assets/svg/$value.svg';
}
