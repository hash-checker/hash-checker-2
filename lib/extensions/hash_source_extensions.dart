import 'dart:core';

import 'package:hash_checker_2/model/hash_source.dart';

extension HashSourceToString on HashSource {
  String get uiName {
    switch (this) {
      case HashSource.none:
        return 'Clear selection';
      case HashSource.file:
        return 'File';
      case HashSource.text:
        return 'Text';
    }
  }
}

extension HashSourceLists on HashSource {}
