import 'package:flutter/material.dart';
import 'dart:math';

import '../model/nav_menu.dart';

class KnobSelector extends StatefulWidget {
  final List<ImageStringPair> icons;
  final int initialValue;
  final ValueChanged<Image> onChanged;

  KnobSelector({
    required this.icons,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _KnobSelectorState createState() => _KnobSelectorState();
}

class _KnobSelectorState extends State<KnobSelector> {
  late int _selectedIndex;
  late double _angle;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialValue;
    _angle = _calculateAngle();
  }

  double _calculateAngle() {
    final range = widget.icons.length;
    final unitAngle = 360 / range;
    return unitAngle * _selectedIndex;
  }

  void _updateValue(double angle) {
    setState(() {
      _angle = angle;
      final range = widget.icons.length;
      final unitAngle = 360 / range;
      int newIndex = (angle / unitAngle).round();
      if (newIndex >= range) {
        newIndex = 0; // Go back to the first element
      }
      _selectedIndex = newIndex;
      widget.onChanged(widget.icons[_selectedIndex].image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        Offset localPosition = renderBox.globalToLocal(details.globalPosition);
        double angle = atan2(
          localPosition.dy - renderBox.size.height / 2,
          localPosition.dx - renderBox.size.width / 2,
        ) *
            180 /
            pi;
        angle = angle + 90;
        if (angle < 0) {
          angle = 360 + angle;
        }
        _updateValue(angle);
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            Center(
              child: ClipOval(child: widget.icons[_selectedIndex].image)
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: _selectedIndex / (widget.icons.length - 1),
                  strokeWidth: 12,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, widget.icons[_selectedIndex].text),
            )
          ],
        ),
      ),
    );
  }
}


