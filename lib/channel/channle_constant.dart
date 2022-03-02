import 'package:flutter/services.dart';

///验证Flutter与原生交互
class ChannelConstant {
  static const String METHOD_CHANNEL = "com.hesen.flutter";
  static final MethodChannel methodChannel = MethodChannel(METHOD_CHANNEL);
}