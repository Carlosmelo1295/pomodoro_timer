import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.icon,
    required this.callback,
    required this.color,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback callback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        foregroundColor: Colors.grey[900],
        backgroundColor: color,
        onPressed: callback,
        child: icon,
      ),
    );
  }
}
