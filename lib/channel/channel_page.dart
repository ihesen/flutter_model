import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///验证flutter和原生channel通讯
class ChannelPageWidget extends StatelessWidget {
  const ChannelPageWidget({Key? key}) : super(key: key);

  static const MethodChannel channel = MethodChannel("Channel_name");

  @override
  Widget build(BuildContext context) {
    channel.setMethodCallHandler(_onMethodCall);

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: showAndroidNativeToast,
              child: const Text(
                "调用Android原生showToast()",
                style: TextStyle(fontSize: 18.0, color: Colors.redAccent),
              ))
        ],
      ),
    );
  }

  void showAndroidNativeToast() async {
    Map params = {"content": "showToast"};
    // var result = await ChannelConstant.methodChannel.invokeMethod("showToast1");
    var result = await channel.invokeMethod("showToast");
    print("result:" + result.toString());
  }

  Future<dynamic> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case "invokeFlutter":
        var argument = call.arguments;
        print("ihesen : $argument");
        break;
      default:
        return "";
    }
  }
}
