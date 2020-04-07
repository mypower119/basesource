import 'package:base_constructor/data/local/db_manager.dart';
import 'package:base_constructor/data/share_preferences.dart';
import 'package:flutter/material.dart';
import 'config/theme.dart';

void main() async {
  await DBManager().initDatabase();
  await SharePreferencesManager().init();
  return runApp(ReportLogin());
}

class ReportLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.MyTheme,
      home: const Center(
        child: Text('Sminapo'),
      ),
    );
  }
}