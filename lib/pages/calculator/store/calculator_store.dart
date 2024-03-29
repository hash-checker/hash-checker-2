// ignore_for_file: use_setters_to_change_properties

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:hash_checker_2/extensions/hash_type_extensions.dart';
import 'package:hash_checker_2/model/hash_compare_result.dart';
import 'package:hash_checker_2/model/hash_source.dart';
import 'package:hash_checker_2/model/hash_type.dart';
import 'package:mobx/mobx.dart';

part 'calculator_store.g.dart';

// ignore: library_private_types_in_public_api
class CalculatorStore = _CalculatorStore with _$CalculatorStore;

abstract class _CalculatorStore with Store {
  @observable
  HashType hashType = HashType.md5;

  @observable
  HashSource hashSource = HashSource.none;

  @observable
  String fileToGenerate = '';

  @observable
  String textValueToGenerate = '';

  @observable
  String originalHash = '';

  @observable
  String generatedHash = '';

  String get source => hashSource == HashSource.none
      ? 'None'
      : hashSource == HashSource.file
          ? fileToGenerate
          : textValueToGenerate;

  HashCompareResult compare() => originalHash == generatedHash ? HashCompareResult.match : HashCompareResult.doNotMatch;

  bool get canSaveGeneratedHashResult => hashSource != HashSource.none;

  Uint8List get generatedHashToFile => Uint8List.fromList(utf8.encode(generatedHash));

  String get fileNameForGeneratedHash => '$source.${hashType.fileExtensionPart}.txt';

  @action
  void setOriginalHash(String originalHash) => this.originalHash = originalHash;

  @action
  void setGeneratedHash(String generatedHash) => this.generatedHash = generatedHash;

  @action
  void setHashType(HashType hashType) => this.hashType = hashType;

  @action
  void setFileToGenerate(String fileToGenerate) {
    this.fileToGenerate = fileToGenerate;
    hashSource = HashSource.file;
  }

  @action
  void setTextValueToGenerate(String textValueToGenerate) {
    this.textValueToGenerate = textValueToGenerate;
    hashSource = HashSource.text;
  }

  @action
  void clearSelections() {
    hashSource = HashSource.none;
    fileToGenerate = '';
    textValueToGenerate = '';
  }

  @action
  void generateHash() {
    List<int>? bytes;
    if (hashSource == HashSource.text) {
      bytes = utf8.encode(textValueToGenerate);
    } else if (hashSource == HashSource.file) {
      bytes = File(fileToGenerate).readAsBytesSync();
    }
    if (bytes != null) {
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
