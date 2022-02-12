import 'package:flutter/material.dart';
import 'package:week9/Nextpage.dart';

class Numpad extends StatefulWidget {
  static const buttonSize = 60.0;

  const Numpad({Key? key}) : super(key: key);

  @override
  State<Numpad> createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  String _numberpad = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade100,
                  Colors.amberAccent,
                ],
              )),
          /*body*/ child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.lock_outlined,
                        size: 70.0,
                        color: const Color(0xff1A123E),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: const Color(0xff1A358E),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Enter PIN to login',
                        style: TextStyle(
                            fontSize: 16.0, color: const Color(0xff1A242E)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Collection for
                    for (var i = 0; i < _numberpad.length; i++)
                      Container(
                        width: 20.0,
                        height: 20.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B8189),
                          shape: BoxShape.circle,
                        ),
                      ),
                    for (var i = 0; i < 6 - _numberpad.length; i++)
                      Container(
                        width: 20.0,
                        height: 20.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff407cde),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(1),
                        _buildButton(2),
                        _buildButton(3),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(4),
                        _buildButton(5),
                        _buildButton(6),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(7),
                        _buildButton(8),
                        _buildButton(9),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Numpad.buttonSize,
                            height: Numpad.buttonSize,
                          ),
                        ),
                        _buildButton(0),
                        _buildButton(-1),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }

  Widget _buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (num == -1) {
            print('Backspace');

            setState(() {
              // '12345'
              var length = _numberpad.length;
              _numberpad = _numberpad.substring(0, length - 1);
            });
          } else {
            if (_numberpad.length < 6)
              setState(() {
                _numberpad = '$_numberpad$num';
              });
            if (_numberpad.length == 6) {
              if (_numberpad == '123456') {
                _numberpad = "";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NextPage()),
                );
              } else {
                showMaterialDialog(
                    context, "Incorrect PIN", "Please try again");
                _numberpad = "";
              }
            }
            print('You pressed $num');
          }
        },
        borderRadius: BorderRadius.circular(Numpad.buttonSize / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.indigo),
            shape: BoxShape.circle,
            color: Colors.white70,
          ),
          alignment: Alignment.center,
          width: Numpad.buttonSize,
          height: Numpad.buttonSize,
          // conditional operator (?:)
          child: (num == -1)

              ? Icon(Icons.backspace_outlined,color: Colors.blue)
              : Text(
            '$num',
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    );
  }

  void showMaterialDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}