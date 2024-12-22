import 'package:flutter/material.dart';

PreferredSizeWidget commonAppBar(
  BuildContext context,
  String title, {
  bool showBackButton = true,
}) {
  return AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    centerTitle: true,
    leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          )
        : null,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
