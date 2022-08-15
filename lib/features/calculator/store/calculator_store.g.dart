// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculatorStore on _CalculatorStore, Store {
  late final _$hashTypeAtom =
      Atom(name: '_CalculatorStore.hashType', context: context);

  @override
  HashType get hashType {
    _$hashTypeAtom.reportRead();
    return super.hashType;
  }

  @override
  set hashType(HashType value) {
    _$hashTypeAtom.reportWrite(value, super.hashType, () {
      super.hashType = value;
    });
  }

  late final _$hashSourceAtom =
      Atom(name: '_CalculatorStore.hashSource', context: context);

  @override
  HashSource get hashSource {
    _$hashSourceAtom.reportRead();
    return super.hashSource;
  }

  @override
  set hashSource(HashSource value) {
    _$hashSourceAtom.reportWrite(value, super.hashSource, () {
      super.hashSource = value;
    });
  }

  late final _$fileToGenerateAtom =
      Atom(name: '_CalculatorStore.fileToGenerate', context: context);

  @override
  String get fileToGenerate {
    _$fileToGenerateAtom.reportRead();
    return super.fileToGenerate;
  }

  @override
  set fileToGenerate(String value) {
    _$fileToGenerateAtom.reportWrite(value, super.fileToGenerate, () {
      super.fileToGenerate = value;
    });
  }

  late final _$textValueToGenerateAtom =
      Atom(name: '_CalculatorStore.textValueToGenerate', context: context);

  @override
  String get textValueToGenerate {
    _$textValueToGenerateAtom.reportRead();
    return super.textValueToGenerate;
  }

  @override
  set textValueToGenerate(String value) {
    _$textValueToGenerateAtom.reportWrite(value, super.textValueToGenerate, () {
      super.textValueToGenerate = value;
    });
  }

  late final _$originalHashAtom =
      Atom(name: '_CalculatorStore.originalHash', context: context);

  @override
  String get originalHash {
    _$originalHashAtom.reportRead();
    return super.originalHash;
  }

  @override
  set originalHash(String value) {
    _$originalHashAtom.reportWrite(value, super.originalHash, () {
      super.originalHash = value;
    });
  }

  late final _$generatedHashAtom =
      Atom(name: '_CalculatorStore.generatedHash', context: context);

  @override
  String get generatedHash {
    _$generatedHashAtom.reportRead();
    return super.generatedHash;
  }

  @override
  set generatedHash(String value) {
    _$generatedHashAtom.reportWrite(value, super.generatedHash, () {
      super.generatedHash = value;
    });
  }

  late final _$_CalculatorStoreActionController =
      ActionController(name: '_CalculatorStore', context: context);

  @override
  void setOriginalHash(String originalHash) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setOriginalHash');
    try {
      return super.setOriginalHash(originalHash);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGeneratedHash(String generatedHash) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setGeneratedHash');
    try {
      return super.setGeneratedHash(generatedHash);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHashType(HashType hashType) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setHashType');
    try {
      return super.setHashType(hashType);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFileToGenerate(String fileToGenerate) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setFileToGenerate');
    try {
      return super.setFileToGenerate(fileToGenerate);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextValueToGenerate(String textValueToGenerate) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setTextValueToGenerate');
    try {
      return super.setTextValueToGenerate(textValueToGenerate);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelections() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.clearSelections');
    try {
      return super.clearSelections();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void generateHash() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.generateHash');
    try {
      return super.generateHash();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hashType: ${hashType},
hashSource: ${hashSource},
fileToGenerate: ${fileToGenerate},
textValueToGenerate: ${textValueToGenerate},
originalHash: ${originalHash},
generatedHash: ${generatedHash}
    ''';
  }
}
