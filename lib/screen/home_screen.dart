import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime firstDay = DateTime.now();

  void onHeartPressed() {
    // setState(() {
    //   firstDay = firstDay.subtract(Duration(days: 1));
    // });

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              // date , time, dateAndTime
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true, // 외부 탭 할 경우 다이어로그 닫기
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text("D-Day"),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CopleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;
    final now2 = DateTime.now();
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(
          "U & I",
          style: textTheme.headline1,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          "우리 처음 만난 날",
          style: textTheme.bodyText1,
        ),
        Text(
          "${now2.year}-${now2.month}-${now2.day}",
          style: textTheme.bodyText2,
        ),
        const SizedBox(
          height: 16.0,
        ),
        IconButton(
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          "D+${DateTime(now2.year, now2.month, now2.day).difference(firstDay).inDays + 1}",
          style: textTheme.headline2,
        ),
      ],
    );
  }
}

class _CopleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'assets/img/main.jpg',
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
