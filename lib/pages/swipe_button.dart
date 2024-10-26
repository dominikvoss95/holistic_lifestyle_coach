import 'package:flutter/material.dart';

class SwipeButton extends StatefulWidget {
  final VoidCallback onSwipeComplete;

  const SwipeButton({Key? key, required this.onSwipeComplete})
      : super(key: key);

  @override
  _SwipeButtonState createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double _dragPosition = 0.0;
  final double _dragThreshold = 150.0;

  void _completeSwipe() {
    setState(() {
      _dragPosition = _dragThreshold;
    });
    widget.onSwipeComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Container
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xff939377), // Dark gray-green background color
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              "Coach me how to eat, \nmove and be healthy",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        // Draggable swipe button
        Positioned(
          left: _dragPosition,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _dragPosition += details.delta.dx;
                if (_dragPosition < 0) {
                  _dragPosition = 0;
                } else if (_dragPosition > _dragThreshold) {
                  _dragPosition = _dragThreshold;
                  widget.onSwipeComplete();
                }
              });
            },
            onHorizontalDragEnd: (_) {
              if (_dragPosition < _dragThreshold) {
                setState(() {
                  _dragPosition = 0; // Reset position if not completed
                });
              }
            },
            onTap: _completeSwipe,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffa3a475), // Match with background
              ),
            ),
          ),
        ),
      ],
    );
  }
}
