import 'package:flutter/widgets.dart';

extension PaddingList on List<Widget> {
  List<Widget> paddingAll({double padding = 0.0}) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.all(padding),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingOnly({
    double bottom = 0.0,
    double top = 0.0,
    double start = 0.0,
    double end = 0.0,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.only(
          top: top,
          bottom: bottom,
          start: start,
          end: end,
        ),
        child: e,
      ),
    ).toList();
  }
}
