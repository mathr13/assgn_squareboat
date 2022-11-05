import 'package:flutter/material.dart';

import 'injector.dart';
import 'sbmain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(const SBANewsApp());
}