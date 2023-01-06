import 'package:flutter/material.dart';

class FTCheckWidget extends StatefulWidget {
  @override
  _FTCheckWidgetState createState() => _FTCheckWidgetState();
}

class _FTCheckWidgetState extends State<FTCheckWidget> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _value
              ? Icon(
                  Icons.check,
                  size: 30.0,
                  color: Colors.white,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  size: 30.0,
                  color: Colors.brown,
                ),
        ),
      ),
    ));
  }
}
