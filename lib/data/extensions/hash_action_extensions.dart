import 'package:hash_checker_2/data/models/hash_action.dart';

extension HashActionToString on HashAction {
  String name() {
    switch (this) {
      case HashAction.compare:
        return 'Compare';
      case HashAction.export:
        return 'Export';
      case HashAction.generate:
        return 'Generate';
    }
  }
}
