import 'package:flutter/material.dart';
import 'package:useful_widgets/src/modules/bottom_sheets/bottom_sheets.dart';

Future<T?> showConstrainedBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isScrollControlled = false,
  bool expanded = false,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  double? maxHeightRate,
  double dragHandleVerticalPadValue = 4,
  BorderRadiusGeometry borderRadius =
      const BorderRadius.vertical(top: Radius.circular(20)),
  bool showDragHandle = true,
  String? title,
  EdgeInsetsGeometry titlePadding = const EdgeInsets.all(16),
  AlignmentGeometry titleAlignment = Alignment.center,
  bool showTitleDivider = false,
  Color backgroundColor = Colors.white,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: borderRadius),
    isScrollControlled: isScrollControlled,
    builder: (bottomSheetContext) {
      return ConstrainedBottomSheet(
        expanded: expanded,
        margin: margin,
        dragHandleVerticalPadValue: dragHandleVerticalPadValue,
        maxHeight: _pureScreenHeight(context) *
            (maxHeightRate ?? (isScrollControlled ? 1.0 : 0.5)),
        borderRadius: borderRadius,
        showDragHandle: showDragHandle,
        backgroundColor: backgroundColor,
        title: title,
        titlePadding: titlePadding,
        titleAlignment: titleAlignment,
        showTitleDivider: showTitleDivider,
        content: builder(bottomSheetContext),
      );
    },
  );
}

double _pureScreenHeight(BuildContext context) {
  // MediaQueryData's height doesn't contains notch's height
  final fullScreenHeight = MediaQuery.of(context).size.height;
  final viewInsetsTopHeight =
      MediaQuery.of(Scaffold.of(context).context).viewPadding.top;

  return fullScreenHeight - viewInsetsTopHeight;
}
