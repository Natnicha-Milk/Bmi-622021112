import 'package:flutter/material.dart';
import 'bmi_main.dart';

class Bmiresult extends StatefulWidget {
  const Bmiresult({Key? key, required this.stdweight, required this.stdheight})
      : super(key: key);

  final String stdweight;
  final String stdheight;

  @override
  _BmiResultState createState() => _BmiResultState();
}

class _BmiResultState extends State<Bmiresult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('---ผลการคำนวณ---'),
        ),
        body: Container(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'BMI ที่คำนวนได้',
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                        Text(
                          'น้ำหนัก',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          widget.stdweight,
                          style: const TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'ส่วนสูง',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          widget.stdheight,
                          style: const TextStyle(fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox bottomBtn() {
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Bmimain(),
                ));
          },
          child: const Text(
            'คำนวณใหม่',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
