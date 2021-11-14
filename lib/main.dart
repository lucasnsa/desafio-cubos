import 'package:desafiocubos/app_module.dart';
import 'package:desafiocubos/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_get_cache/http_get_cache.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetCache.initialize();

  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
