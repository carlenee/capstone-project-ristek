import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../services/shared_preferences.dart';
import '../constants/dictionary.dart';

class Config {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesService.init();

    Intl.defaultLocale = CapstoneDictionary.locale;
    timeago.setLocaleMessages(CapstoneDictionary.locale, timeago.IdMessages());
    await initializeDateFormatting(CapstoneDictionary.locale, '');
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
