import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:mishamosher_tiktoken/mishamosher_tiktoken.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TiktokenDataProcessCenter().initData(ignorePackageName: true);

  var map = {
    'cl100k_base': TiktokenDataProcessCenter().cl100kBase,
    'gpt2': TiktokenDataProcessCenter().gpt2,
    'p50k_base': TiktokenDataProcessCenter().p50kBase,
    'r50k_base': TiktokenDataProcessCenter().r50kBase,
    'o200k_base': TiktokenDataProcessCenter().o200kBase,
  };

  for (var key in map.keys) {
    var data = map[key];
    if (data == null) {
      continue;
    }
    var dir = Directory(key);
    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }
    dir.createSync();

    await File('$key/${key}.json').writeAsString(json.encode(data.entries));
  }
}
