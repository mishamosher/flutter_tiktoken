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

  Future<void> initata({bool ignorePackageName = false}) async {
    await initCl100kBaseData(ignorePackageName: ignorePackageName);
    await initGpt2Data(ignorePackageName: ignorePackageName);
    await initP50kBaseData(ignorePackageName: ignorePackageName);
    await initR50kBaseData(ignorePackageName: ignorePackageName);
    await initO200kBaseData(ignorePackageName: ignorePackageName);
  }

  Future<void> initCl100kBaseData({bool ignorePackageName = false}) async {
    var prefix = _prefix;
    if (ignorePackageName == true) {
      prefix = '';
    }
    String jsonString = await rootBundle.loadString('${prefix}lib/tokens/cl100k_base/cl100k_base.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    Map<String, int> intData = jsonData.map((key, value) => MapEntry(key, value is int ? value : int.parse(value.toString())));
    cl100kBase.addAll(intData);
  }

  Future<void> initGpt2Data({bool ignorePackageName = false}) async {
    var prefix = _prefix;
    if (ignorePackageName == true) {
      prefix = '';
    }
    String jsonString = await rootBundle.loadString('${prefix}lib/tokens/gpt2/gpt2.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    Map<String, int> intData = jsonData.map((key, value) => MapEntry(key, value is int ? value : int.parse(value.toString())));
    gpt2.addAll(intData);
  }

  Future<void> initP50kBaseData({bool ignorePackageName = false}) async {
    var prefix = _prefix;
    if (ignorePackageName == true) {
      prefix = '';
    }
    String jsonString = await rootBundle.loadString('${prefix}lib/tokens/p50k_base/p50k_base.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    Map<String, int> intData = jsonData.map((key, value) => MapEntry(key, value is int ? value : int.parse(value.toString())));
    p50kBase.addAll(intData);
  }

   Future<void> initR50kBaseData({bool ignorePackageName = false}) async {
    var prefix = _prefix;
    if (ignorePackageName == true) {
      prefix = '';
    }
    String jsonString = await rootBundle.loadString('${prefix}lib/tokens/r50k_base/r50k_base.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    Map<String, int> intData = jsonData.map((key, value) => MapEntry(key, value is int ? value : int.parse(value.toString())));
    r50kBase.addAll(intData);
  }

  Future<void> initO200kBaseData({bool ignorePackageName = false}) async {
    var prefix = _prefix;
    if (ignorePackageName == true) {
      prefix = '';
    }
    String jsonString = await rootBundle.loadString('${prefix}lib/tokens/o200k_base/o200k_base.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    Map<String, int> intData = jsonData.map((key, value) => MapEntry(key, value is int ? value : int.parse(value.toString())));
    o200kBase.addAll(intData);
  }
}
