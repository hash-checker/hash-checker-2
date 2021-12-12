import 'package:hash_checker_2/data/models/hash_type.dart';
import 'package:mobx/mobx.dart';

part 'calculator_store.g.dart';

class CalculatorStore = _CalculatorStore with _$CalculatorStore;

abstract class _CalculatorStore with Store {
  @observable
  HashType hashType = HashType.md5;

  @observable
  String generatedHash = '';

  @action
  void setHashType(HashType hashType) {
    this.hashType = hashType;
  }

  @action
  void generateHash() {

  }
}
