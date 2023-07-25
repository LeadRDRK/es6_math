import 'package:test/test.dart';

import 'vanilla_test.dart' as vanilla_test;
import 'native_test.dart' as native_test;

void main() {
  group('vanilla', vanilla_test.main);
  group('native', native_test.main);
}