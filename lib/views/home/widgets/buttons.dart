import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.icon,
    required this.callback,
    required this.color,
    required this.heroTag,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback callback;
  final Color color;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        heroTag: heroTag,
        foregroundColor: Colors.grey[900],
        backgroundColor: color,
        onPressed: callback,
        child: icon,
      ),
    );
  }
}
