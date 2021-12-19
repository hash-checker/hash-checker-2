import 'dart:core';

import 'package:hash_checker_2/data/models/hash_source.dart';

extension HashSourceToString on HashSource {
  String get name {
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

extension HashSourceLists on HashSource {
}
