import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Future<Object?> kNavigator(BuildContext context, var page) async {
  return await Navigator.push(
      context, MaterialPageRoute(builder: (context) => page));
}

Future kNavigatorPushNamed(BuildContext context, String route) async {
  return await Navigator.pushNamed(context, route);
}

void kNavigatorReplace(BuildContext context, var page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void kNavigatorReplacementName(BuildContext context, String page) {
  Navigator.pushReplacementNamed(context, page);
}

Future<Object?> kNavigatorPushNamedRemoveUntil(
    BuildContext context, var route) async {
  return await Navigator.of(context)
      .pushNamedAndRemoveUntil(route, (r) => false);
}

void kNavigatorPushRemove(BuildContext context, var page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

Future<Object?> kNavigatorPushTransition(BuildContext context, var page) async {
  return await Navigator.of(context).push(PageTransition(
      type: PageTransitionType.bottomToTop,
      child: page,
      inheritTheme: true,
      fullscreenDialog: true,
      reverseDuration: const Duration(milliseconds: 350),
      duration: const Duration(milliseconds: 350),
      ctx: context));
}
