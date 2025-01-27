import 'dart:ui';
import 'package:get/route_manager.dart';

part 'translation_en.dart';
part 'translation_th.dart';

class AppTranslation extends Translations {
  static const Locale th = Locale('th', 'TH');
  static const Locale en = Locale('en', 'US');

  static const Map<String, Map<String, String>> _keys = {
    'en': getEn,
    'th': getTh,
  };

  @override
  Map<String, Map<String, String>> keys = _keys;
}
