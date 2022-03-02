import 'package:flutter/material.dart';
import 'package:flutter_model/widget/data/datepicker_page.dart';

import 'network/network_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  _goToNetworkPage(context);
                },
                child: const Text("网络相关", style: TextStyle(fontSize: 18.0))),
            TextButton(
                onPressed: () {
                  _goToDatePage(context);
                },
                child: const Text("日期选择", style: TextStyle(fontSize: 18.0)))
          ],
        ),
      ),
    );
  }

  void _goToNetworkPage(BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const NetworkPage();
    }));
  }

  void _goToDatePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const DateWidgetPage();
    }));
  }
}