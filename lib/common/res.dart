class R {
  static final icons = _Icons();
  static final images = _Images();
}

class _Images {
  static const path = 'assets/images';
  final originBaseUrl =
      'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/image/origin-webp/';
  final thumbnailBaseUrl =
      'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/image/480-webp/';
  final icons = '$path/app-list-1.png';
}

class _Icons {
  static const path = 'assets/icons';
  final icons = '$path/icons.svg';
  final setting = '$path/appbar_icon_setting_default.svg';
  final camera = '$path/icon_camera.svg';
  final arrowRight = '$path/btn_icon_arrow_right.svg';
  final novip = '$path/novip.svg';
  final vip = '$path/vip.svg';
  final home = '$path/nav_icon_home_default.svg';
  final my = '$path/nav_icon_my_default.svg';
  final search = '$path/icon_search.svg';
  final icon = '$path/icon.svg';
  final heartSelected = '$path/btn_icon_heart_selected.svg';
  final heartUnselected = '$path/btn_icon_heart_default.svg';
  final back = '$path/appbar_icon_back_default.svg';
  final download = '$path/btn_icon_download_default.svg';
  final heartBigSelected = '$path/btn_icon_heartBig_selected.svg';
  final hearBig = '$path/btn_icon_heartBig.svg';
}
