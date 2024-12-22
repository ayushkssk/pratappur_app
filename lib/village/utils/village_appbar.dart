import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/language_provider.dart';
import '../../widgets/language_switcher.dart';

PreferredSizeWidget villageAppBar(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);
  final isHindi = languageProvider.isHindi;

  return AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    title: Text(
      isHindi ? 'प्रतापपुर' : 'Pratappur',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: const [
      LanguageSwitcher(),
      SizedBox(width: 8),
    ],
  );
}
