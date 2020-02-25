import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  final TextEditingController _dcontroller = TextEditingController();
  int a, b, c, d, result1 = 0, result2 = 0;
  var operation = ['+', '-', 'x', '/'];
  var _currentValueSelected = '+';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fraction Calculator'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _acontroller,
                          )),
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Container(
                          width: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _bcontroller,
                          )),
                    ],
                  ),
                ),
                Container(
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border.all()),
                    child: DropdownButton<String>(
                      items: operation.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        _onDropDownItemSelected(newValueSelected);
                      },
                      value: _currentValueSelected,
                    )),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _ccontroller,
                          )),
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Container(
                          width: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _dcontroller,
                          )),
                    ],
                  ),
                ),
                Text(
                  "=",
                  style: TextStyle(fontSize: 50),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text("$result1"),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text("$result2"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Calculate"),
                  textColor: Colors.white,
                  onPressed: _press1,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                ),
                RaisedButton(
                  child: Text("Clear"),
                  textColor: Colors.white,
                  onPressed: _press2,
                  color: Colors.grey,
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentValueSelected = newValueSelected;
    });
  }

  void _press1() {
    setState(() {
      a = int.parse(_acontroller.text);
      b = int.parse(_bcontroller.text);
      c = int.parse(_ccontroller.text);
      d = int.parse(_dcontroller.text);
      if (_currentValueSelected == '+') {
        result1 = (a * d) + (b * c);
        result2 = b * d;
      } else if (_currentValueSelected == '-') {
        result1 = (a * d) - (b * c);
        result2 = b * d;
      } else if (_currentValueSelected == 'x') {
        result1 = a * c;
        result2 = b * d;
      } else if (_currentValueSelected == '/') {
        result1 = a * d;
        result2 = b * c;
      }
      for (int i = 2; i <= 100000; i++) {
        while (result1 % i == 0 && result2 % i == 0) {
          result1 = (result1 / i).round();
          result2 = (result2 / i).round();
        }
      }
    });
  }

  void _press2() {
    setState(() {
      _acontroller.text = "";
      _bcontroller.text = "";
      _ccontroller.text = "";
      _dcontroller.text = "";
      result1 = 0;
      result2 = 0;
    });
  }
}
