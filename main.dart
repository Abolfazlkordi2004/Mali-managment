import 'package:flutter/material.dart';
import 'package:mali/Views/Auth/login_view.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: LoginView(),
      ),
    ),
  );
}
