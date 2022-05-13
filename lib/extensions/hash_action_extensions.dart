import 'package:hash_checker_2/model/hash_action.dart';

extension HashActionToString on HashAction {
  String get uiName {
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
