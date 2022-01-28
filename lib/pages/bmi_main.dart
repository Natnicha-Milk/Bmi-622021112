import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bmi_result.dart';

class Bmimain extends StatefulWidget {
  const Bmimain({Key? key}) : super(key: key);

  @override
  _BmimainState createState() => _BmimainState();
}

class _BmimainState extends State<Bmimain> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _stdweight = TextEditingController();
  final TextEditingController _stdheight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('---BMI---'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('กรอกข้อมูล'),
            Stdweight(),
            Stdheight(),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bmiresult(
                            stdweight: _stdweight.text,
                            stdheight: _stdheight.text,
                          ),
                        ));
                  }
                },
                child: const Text('คำนวณ'))
          ],
        ),
      ),
    );
  }

  Widget Stdweight() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _stdweight,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "กรุณากรอกค่าน้ำหนัก";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'น้ำหนัก',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  Widget Stdheight() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _stdheight,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "กรุณากรอกค่าส่วนสูง";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'ส่วนสูง',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }
}
