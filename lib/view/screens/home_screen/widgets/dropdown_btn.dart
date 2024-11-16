import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  int? _selectedNumber;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: DropdownButton<int>(
        value: _selectedNumber,
        hint: Text('25'),
        items: List.generate(25, (index) {
          int number = index + 1;
          return DropdownMenuItem<int>(
            value: number,
            child: Text(number.toString()),
          );
        }),
        onChanged: (value) {
          setState(() {
            _selectedNumber = value;
          });
        },
      ),
    );
  }
}
