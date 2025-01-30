import 'package:app1/screens/home_page.dart';
import 'package:app1/screens/login_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {"home": (_) => const HomePage(), "login": (_) => const LoginPage()};
}
