import 'package:aplikasi/presentation/page/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class second_page extends StatefulWidget {
  final String name;

  second_page({required this.name});

  @override
  _second_pageState createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {
  String selectedUserName = 'Selected User Name';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Second Screen'),
      ),
      child: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text('Welcome'),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text(widget.name),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(
                        selectedUserName,
                        textAlign: TextAlign.center,
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(43, 99, 123, 1)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => third_page(
                            onUserNameSelected: (userName) {
                              setState(() {
                                selectedUserName = userName;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: const Text('Choose a User', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
