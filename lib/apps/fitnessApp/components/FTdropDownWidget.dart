import 'package:flutter/material.dart';

class Drop extends StatefulWidget {
  @override
  _DropState createState() => _DropState();
}

class _DropState extends State<Drop> {
  String  _value = 'MALE';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(hint: Text('MALE'),isExpanded: true,
      value: _value,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      iconSize: 32,
      elevation: 16,
      underline: Container(
        height: 0.7,color: Colors.grey,
      ),
      onChanged: ( newValue) {
        setState(() {
          _value = newValue!;
        });
      },

      items: ['MALE', 'FEMALE', 'TRANS', 'OTHER']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value,style:TextStyle(fontSize: 14,letterSpacing: 1)),
        );
      }).toList(),
    );

  }
}
