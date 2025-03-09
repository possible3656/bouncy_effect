import 'package:flutter/material.dart';

/// A widget that adds a bouncy scale animation effect to its child when tapped.
///
/// When tapped, the child widget will scale down and then bounce back to its
/// original size when released. This provides tactile feedback for user interactions.
///
/// Example usage:
/// ```dart
/// BouncyEffect(
///   onTap: () {
///     print('Tapped!');
///   },
///   child: Container(
///     width: 100,
///     height: 100,
///     color: Colors.blue,
///   ),
/// )
/// ```
class BouncyEffect extends StatefulWidget {
  /// Creates a bouncy effect widget.
  ///
  /// The [child] parameter is required and specifies the widget to animate.
  ///
  /// The [onTap] callback is optional and will be called when the widget is tapped.
  ///
  /// If [isScalingEnabled] is false, the bouncy animation will be disabled.
  ///
  /// The [lowerBound] parameter controls how much the widget scales down when pressed.
  /// For example, 0.9 means it will scale to 90% of its original size.
  const BouncyEffect({
    super.key,
    required this.child,
    this.onTap,
    this.isScalingEnabled = true,
    this.lowerBound = 0.9,
  });

  /// The widget to apply the bouncy effect to
  final Widget child;

  /// Callback that will be called when the widget is tapped
  final VoidCallback? onTap;

  /// Whether the scaling animation is enabled
  final bool isScalingEnabled;

  /// The scale factor to animate to when pressed (between 0.0 and 1.0)
  final double lowerBound;

  @override
  State<BouncyEffect> createState() => _BouncyEffectState();
}

class _BouncyEffectState extends State<BouncyEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      lowerBound: widget.lowerBound,
      vsync: this,
    )..value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (!_isDisposed) {
          _controller.reverse();
        }
      },
      onTapUp: (_) {
        if (!_isDisposed) {
          _controller.forward();
        }
        widget.onTap?.call();
      },
      onTapCancel: () {
        if (!_isDisposed) {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: widget.isScalingEnabled ? _controller.value : 1,
            child: ColoredBox(color: Colors.transparent, child: child),
          );
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _isDisposed = true; // Mark the widget as disposed
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}
