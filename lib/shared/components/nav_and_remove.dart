import 'package:flutter/material.dart';

void customNavAndRemove(context, {required String routeName}) {
  Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
}
