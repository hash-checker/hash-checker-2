import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hash_checker_2/data/models/hash_source.dart';
import 'package:hash_checker_2/data/models/hash_type.dart';
import 'package:mobx/mobx.dart';

part 'calculator_store.g.dart';

class CalculatorStore = _CalculatorStore with _$CalculatorStore;

abstract class _CalculatorStore with Store {
  @observable
  HashType hashType = HashType.md5;

  @observable
  HashSource hashSource = HashSource.none;

  @observable
  String textValueToGenerate = '';

  @observable
  String generatedHash = '';

  @action
  void setHashType(HashType hashType) {
    this.hashType = hashType;
  }

  @action
  void setHashSource(HashSource hashSource) {
    this.hashSource = hashSource;
  }

  @action
  void setTextValueToGenerate(String value) {
    textValueToGenerate = value;
  }

  @action
  void generateHash() {
    if (hashSource == HashSource.text) {
      final bytes = utf8.encode(textValueToGenerate);
      switch (hashType) {
        case HashType.md5:
          generatedHash = md5.convert(bytes).toString();
          break;
        case HashType.sha1:
          generatedHash = sha1.convert(bytes).toString();
          break;
        case HashType.sha224:
          generatedHash = sha224.convert(bytes).toString();
          break;
        case HashType.sha256:
          generatedHash = sha256.convert(bytes).toString();
          break;
        case HashType.sha384:
          generatedHash = sha384.convert(bytes).toString();
          break;
        case HashType.sha512:
          generatedHash = sha512.convert(bytes).toString();
          break;
        case HashType.sha512_224:
          generatedHash = sha512224.convert(bytes).toString();
          break;
        case HashType.sha512_256:
          generatedHash = sha512256.convert(bytes).toString();
          break;
      }
    }
  }
}
