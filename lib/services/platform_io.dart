import 'dart:io' show Platform;

class PlatformStub {
  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;
  bool get isMacOS => Platform.isMacOS;
  bool get isLinux => Platform.isLinux;
  bool get isWindows => Platform.isWindows;
}