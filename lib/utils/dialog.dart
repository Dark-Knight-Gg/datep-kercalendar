import 'dart:math';

import 'package:flutter/material.dart';

import '../model/calendar_date_picker.dart';
import '../widget/date_range__picker_button.dart';

Future<List<DateTime?>?> showRangeDatePickerDialog({
  required BuildContext context,
  required DateRangePickerButtonConfig config,
  required Size dialogSize,
  List<DateTime?> initialValue = const [],
  BorderRadius? borderRadius,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  bool useSafeArea = true,
  Color? dialogBackgroundColor,
  RouteSettings? routeSettings,
  String? barrierLabel,
  TransitionBuilder? builder,
}) {
  var dialog = Dialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    backgroundColor: dialogBackgroundColor ?? Theme.of(context).canvasColor,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
    clipBehavior: Clip.antiAlias,
    child: SizedBox(
      width: dialogSize.width,
      height: max(dialogSize.height, 410),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateRangePickerButton(
            initialValue: initialValue,
            config: config.copyWith(openedFromDialog: true),
          ),
        ],
      ),
    ),
  );

  return showDialog<List<DateTime?>>(
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
  );
}
