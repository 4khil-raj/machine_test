import 'package:flutter/material.dart';

class RowNames extends StatelessWidget {
  const RowNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.check_box_outline_blank_outlined,
            color: Color.fromARGB(255, 171, 170, 170),
          ),
        ),
        Expanded(
          child: Row(
            children: List.generate(
              8,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getColumnName(index),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getColumnName(int index) {
    switch (index) {
      case 0:
        return 'LOGO';
      case 1:
        return 'CLIENT ID';
      case 2:
        return 'CLIENT NAME';
      case 3:
        return 'PHONE NUMBER';
      case 4:
        return 'EMAIL ADDRESS';
      case 5:
        return 'LOCATION';
      case 6:
        return 'ADDRESS';
      case 7:
        return 'STATUS';
      default:
        return '';
    }
  }
}
