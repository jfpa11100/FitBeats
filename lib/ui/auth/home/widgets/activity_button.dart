import 'package:flutter/material.dart';

class ActivityButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;
  final bool background;
  final double iconSize;
  final Color iconColor;

  const ActivityButton({
    super.key,
    required this.icon,
    required this.text,
    this.background = true,
    this.width = 100.0,
    this.height = 110.0,
    this.iconColor = Colors.white,
    this.iconSize = 40.0,
  });

  @override
  State<ActivityButton> createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      style:
          widget.background
              ? TextButton.styleFrom(
                fixedSize: Size(widget.width, widget.height),
                backgroundColor: const Color.fromARGB(255, 17, 18, 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: isPressed ? Colors.white : Colors.transparent,
                    width: 2,
                  ),

                ),
              )
              : TextButton.styleFrom(
                fixedSize: Size(widget.width, widget.height),
                backgroundColor: isPressed ? Colors.grey[900] : Colors.transparent,
                shape: CircleBorder(
                  side: BorderSide(
                    color: isPressed ? Colors.white : Colors.transparent,
                    width: 2,
                  ),

                ),
              ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon, size: widget.iconSize, color: widget.iconColor),
          SizedBox(height: 5),
          if (widget.text.isNotEmpty)
            Text(widget.text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
