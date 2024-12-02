import 'dart:math';

import 'components/nav_custom_clipper.dart';
import 'package:flutter/material.dart';
import 'components/nav_button.dart';
import 'components/nav_custom_painter.dart';

typedef _LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final List<String> itemsNames;
  final int index;
  final Color color;
  final Color? buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int>? onTap;
  final _LetIndexPage letIndexChange;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final double? maxWidth;
  final bool animate;
  CurvedNavigationBar({
    super.key,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    _LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 75.0,
    this.maxWidth,
    required this.animate,
    required this.itemsNames,
  })  : letIndexChange = letIndexChange ?? ((_) => true),
        assert(items.isNotEmpty),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0),
        assert(maxWidth == null || 0 <= maxWidth);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  late int _endingIndex;
  late double _pos;
  double _buttonHide = 0;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[2];
    _length = widget.items.length;
    _pos = 2 / _length;
    _startingPos = 2 / _length;
    _endingIndex = 2;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        if (widget.animate) {
          _pos = _animationController.value;
          final endingPos = _endingIndex / widget.items.length;
          final middle = (endingPos + _startingPos) / 2;
          if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
            _icon = widget.items[_endingIndex];
          }
          _buttonHide =
              (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: widget.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = min(
              constraints.maxWidth, widget.maxWidth ?? constraints.maxWidth);
          return Align(
            child: Container(
              color: widget.backgroundColor,
              width: maxWidth,
              child: ClipRect(
                clipper: NavCustomClipper(
                  deviceHeight: MediaQuery.sizeOf(context).height,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: -40 - (75.0 - widget.height),
                      width: width * .24,
                      child: Center(
                        child: Transform.translate(
                          offset: const Offset(
                            0,
                            -(1) * 90,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: widget.items[2],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0 - (75.0 - widget.height),
                      child: CustomPaint(
                        painter: NavCustomPainter(
                            _pos, _length, widget.color, textDirection),
                        child: Container(
                          height: 90.0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0 - (75.0 - widget.height),
                      child: SizedBox(
                          height: 100.0,
                          child: Row(
                              children: widget.items.map((item) {
                            return NavButton(
                              title:
                                  widget.itemsNames[widget.items.indexOf(item)],
                              animate: widget.animate,
                              onTap: _buttonTap,
                              position: _pos,
                              length: _length,
                              index: widget.items.indexOf(item),
                              child: Center(child: item),
                            );
                          }).toList())),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index) || _animationController.isAnimating) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      if (widget.animate) {
        _animationController.animateTo(newPosition,
            duration: widget.animationDuration, curve: widget.animationCurve);
      }
    });
  }
}
