import 'package:flutter/material.dart';

class ConstrainedBottomSheet extends StatelessWidget {
  const ConstrainedBottomSheet({
    super.key,
    required this.content,
    this.expanded = false,
    this.maxHeight,
    this.dragHandleVerticalPadValue = 4,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.borderRadius = const BorderRadius.vertical(top: Radius.circular(20)),
    this.showDragHandle = true,
    this.title,
    this.titlePadding = const EdgeInsets.all(16),
    this.titleAlignment = Alignment.center,
    this.showTitleDivider = false,
  });

  final Widget content;
  final bool expanded;
  final double? maxHeight;
  final double dragHandleVerticalPadValue;
  final EdgeInsetsGeometry margin;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final bool showDragHandle;
  final String? title;
  final EdgeInsetsGeometry titlePadding;
  final AlignmentGeometry titleAlignment;
  final bool showTitleDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      constraints:
          maxHeight != null ? BoxConstraints(maxHeight: maxHeight!) : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showDragHandle) _dragHandle,
            if (title != null) _contentTitle,
            if (title != null && showTitleDivider) _titleDivider,
            expanded ? Expanded(child: content) : content,
          ],
        ),
      ),
    );
  }

  Widget get _dragHandle {
    return Container(
      padding: EdgeInsets.symmetric(vertical: dragHandleVerticalPadValue),
      alignment: Alignment.center,
      child: Container(
        width: 32,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget get _contentTitle {
    return Align(
      alignment: titleAlignment,
      child: Padding(
        padding: titlePadding,
        child: Text(
          title!,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }

  Widget get _titleDivider {
    return const Divider(height: 1, color: Color(0xFFDDDDDD));
  }
}
