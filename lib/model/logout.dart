import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/layouts/show_my_dialog_loggof.dart';
import 'package:shared_preferences/shared_preferences.dart';

loggout(BuildContext context) async {
  showMyDialogLoggof(context);
}

confirmedLoggout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.pushNamed(context, '/');
}