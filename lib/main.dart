import 'package:flutter/material.dart';
import 'package:flutter_gastosapp/generated/l10n.dart';
import 'package:flutter_gastosapp/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,
    ),
  );
}