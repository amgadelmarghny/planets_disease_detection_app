import 'package:flutter/material.dart';

void customNovAndRemove(context, {required String routeName}) {
  Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
}
