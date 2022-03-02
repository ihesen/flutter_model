import 'package:flutter/material.dart';

///日期时间控件
class DateWidgetPage extends StatefulWidget {
  const DateWidgetPage({Key? key}) : super(key: key);

  @override
  State<DateWidgetPage> createState() => _DateWidgetPageState();
}

class _DateWidgetPageState extends State<DateWidgetPage> {
  var _selectDateValue = DateTime.now().toString();
  TimeOfDay _selectTimeValue =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("日期选择控件"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text(
                  "日期选择",
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: _selectDatePicker,
              ),
              Text(_selectDateValue)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text(
                  "时间选择",
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: _selectTimePicker,
              ),
              Text(MaterialLocalizations.of(context).formatTimeOfDay(_selectTimeValue, alwaysUse24HourFormat: true))
            ],
          )
        ],
      ),
    );
  }

  ///选择日期
  void _selectDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30 * 6)), //最近半年
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _selectDateValue = "$value";
        print("日期:$value");
      });
    });
  }

  ///选择时间
  void _selectTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _selectTimeValue = value!;
        print("时间: $value");
      });
    });
  }
}
