import 'package:flutter/widgets.dart';
import 'package:mishamosher_tiktoken/mishamosher_tiktoken.dart';
import 'package:mishamosher_tiktoken/src/error/tiktoken_error.dart';
import 'package:test/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TiktokenDataProcessCenter().initData(ignorePackageName: true);
  
  group('mappings', () {
    test('finds correct encoding for model name', () {
      expect(encodingForModel("gpt-3.5-turbo-0301").name, "cl100k_base");
      expect(encodingForModel("ada").name, "r50k_base");
      expect(encodingForModel("cushman-codex").name, "p50k_base");
      expect(encodingForModel("code-davinci-edit-001").name, "p50k_edit");
      expect(encodingForModel("gpt-4o").name, "o200k_base");
    });

    test('throws on unknown model name', () {
      expect(() => encodingForModel(""), throwsA(isA<TiktokenError>()));
      expect(() => encodingForModel("hello"), throwsA(isA<TiktokenError>()));
      expect(() => encodingForModel("gpt-5"), throwsA(isA<TiktokenError>()));
    });
  });
}
