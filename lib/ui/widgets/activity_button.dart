import 'package:flutter/material.dart';

class ActivityButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;

  const ActivityButton({
    super.key,
    required this.icon,
    required this.text,
    this.width = 100.0,
    this.height = 110.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: const Color.fromARGB(255, 17, 18, 22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 5),
          if (text.isNotEmpty)
            Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
