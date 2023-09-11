import 'package:flutter/material.dart';

import 'app.dart';
import 'core/environments/config.dart';

void main() async {
  Config.init().then((value) => runApp(const App()));
}
