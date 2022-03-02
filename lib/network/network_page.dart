import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 测试flutter dio网络请求
class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NetworkPageState();
  }
}

class _NetworkPageState extends State<NetworkPage> {
  var _responseContent = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("网络请求相关")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                child: const Text(
                  "Post请求网络",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
                onPressed: _requestPost),
            TextButton(
              child: const Text(
                "Get请求网络",
                style: TextStyle(color: Colors.amber, fontSize: 18.0),
              ),
              onPressed: _requestGet,
            ),
            Text(
              _responseContent,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  _requestGet() async {
    print("发送请求");
    try {
      var response = await Dio()
          .get('https://api.apiopen.top/getJoke?page=1&count=2&type=video');
      setState(() {
        _responseContent = response.toString();
      });
      print("response:" + response.toString());
    } catch (e) {
      print(e);
    }
  }

  _requestPost() async {
    print("发送post请求");
    var baseUrl = "http://v.juhe.cn/weather";
    var params = '{"cityname":"北京"}';
    var response = await Dio(BaseOptions(baseUrl: baseUrl, headers: {
      'accept': 'application/json, text/plain, */*',
    })).post("/index", data: params);
    setState(() {
      _responseContent = response.toString();
    });
    print("response:" + response.toString());
  }
}
