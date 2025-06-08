import 'package:flutter/material.dart';

class ActivityButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;
  final bool background;
  final double iconSize;
  final Color iconColor;
  final bool isSelected;
  final void Function(bool) onChanged;

  const ActivityButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onChanged,
    this.background = true,
    this.width = 100.0,
    this.height = 110.0,
    this.iconColor = Colors.white,
    this.iconSize = 40.0,
    this.isSelected = false,
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onChanged(!isSelected);
      },
      style:
          background
              ? TextButton.styleFrom(
                fixedSize: Size(width, height),
                backgroundColor: const Color.fromARGB(255, 17, 18, 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: isSelected ? Colors.white : Colors.transparent,
                    width: 2,
                  ),

                ),
              )
              : TextButton.styleFrom(
                fixedSize: Size(width, height),
                backgroundColor: isSelected ? Colors.grey[900] : Colors.transparent,
                shape: CircleBorder(
                  side: BorderSide(
                    color: isSelected ? Colors.white : Colors.transparent,
                    width: 2,
                  ),

                ),
              ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: iconColor),
          SizedBox(height: 5),
          if (text.isNotEmpty)
            Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
