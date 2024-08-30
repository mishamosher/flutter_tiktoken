import 'dart:convert';
import 'package:flutter/services.dart';

class TiktokenDataProcessCenter {
  static final TiktokenDataProcessCenter _singleton = TiktokenDataProcessCenter._internal();
  static const _prefix = 'packages/mishamosher_tiktoken/';

  Map<String, int> cl100kBase = {};
  Map<String, int> gpt2 = {};
  Map<String, int> r50kBase = {};
  Map<String, int> p50kBase = {};
  Map<String, int> o200kBase = {};

  factory TiktokenDataProcessCenter() {
    return _singleton;
  }

  TiktokenDataProcessCenter._internal();

  Future<void> initData({bool ignorePackageName = false}) async {
    await initEncodingData(encoding: 'cl100k_base', map: cl100kBase, ignorePackageName: ignorePackageName);
    await initEncodingData(encoding: 'gpt2', map: gpt2, ignorePackageName: ignorePackageName);
    await initEncodingData(encoding: 'p50k_base', map: p50kBase, ignorePackageName: ignorePackageName);
    await initEncodingData(encoding: 'r50k_base', map: r50kBase, ignorePackageName: ignorePackageName);
    await initEncodingData(encoding: 'o200k_base', map: o200kBase, ignorePackageName: ignorePackageName);
  }

  Future<void> initEncodingData({
    required String encoding,
    required Map<String, int> map,
    bool ignorePackageName = false
  }) async {
    var prefix = _prefix;
    if (ignorePackageName == true) {
      prefix = '';
    }
    String jsonString = await rootBundle.loadString('${prefix}lib/tokens/${encoding}/data.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    Map<String, int> intData = jsonData.map((key, value) => MapEntry(key, value is int ? value : int.parse(value.toString())));
    map.addAll(intData);
  }
}
