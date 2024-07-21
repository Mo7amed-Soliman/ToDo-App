import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  //! push
  push(Widget view) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) {
          return view;
        },
      ),
    );
  }

  pushReplacement(Widget view) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) {
          return view;
        },
      ),
    );
  }

  //! push named
  pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  //! pop
  void pop() => Navigator.of(this).pop();
}
