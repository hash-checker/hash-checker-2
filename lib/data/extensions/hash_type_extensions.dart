import 'package:hash_checker_2/data/models/hash_type.dart';

extension HashTypeToString on HashType {
  String get name {
    switch (this) {
      case HashType.md5:
        return 'MD5';
      case HashType.sha1:
        return 'SHA-1';
      case HashType.sha224:
        return 'SHA-224';
      case HashType.sha256:
        return 'SHA-256';
      case HashType.sha384:
        return 'SHA-384';
      case HashType.sha512:
        return 'SHA-512';
      case HashType.sha512_224:
        return 'SHA-512/224';
      case HashType.sha512_256:
        return 'SHA-512/256';
    }
  }
}
