import 'package:flutter/material.dart';
import 'package:useful_widgets/src/modules/custom_paint_container/custom_paint_container.dart';


class CustomPaintContainer extends StatelessWidget {
  const CustomPaintContainer({
    super.key,
    required this.onPaint,
    this.autoSaveAndRestoreCanvas = true,
    this.child,
  });

  final void Function(CustomPaintUtil, Size) onPaint;
  final bool autoSaveAndRestoreCanvas;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomPaintUtil(
        onPaint: onPaint,
        autoSaveAndRestore: autoSaveAndRestoreCanvas,
      ),
      child: child,
    );
  }
}
