import 'package:flutter/material.dart';

class ButtonViewContainer extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final Color borderColor;

  const ButtonViewContainer({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.borderColor,
  }) : super(key: key);

  @override
  _ButtonViewContainerState createState() => _ButtonViewContainerState();
}

class _ButtonViewContainerState extends State<ButtonViewContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isPressed = false;
          });
          widget.onPressed();
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: _isPressed ? Colors.grey[300] : Colors.white,
            border: Border.all(color: widget.borderColor),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: _isPressed
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(color: widget.borderColor),
          ),
        ),
      ),
    );
  }
}
