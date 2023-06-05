import 'package:hash_checker_2/model/hash_type.dart';

extension HashTypeToString on HashType {
  String get uiName {
    switch (this) {
      case HashType.crc32:
        return 'CRC32';
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
      case HashType.sha3_224:
        return 'SHA3-224';
      case HashType.sha3_256:
        return 'SHA3-256';
      case HashType.sha3_384:
        return 'SHA3-384';
      case HashType.sha3_512:
        return 'SHA3-512';
    }
  }
}

extension HashTypeToFileExtensionPart on HashType {
  String get fileExtensionPart {
    switch (this) {
      case HashType.crc32:
        return 'crc32';
      case HashType.md5:
        return 'md5';
      case HashType.sha1:
        return 'sha1';
      case HashType.sha224:
        return 'sha224';
      case HashType.sha256:
        return 'sha256';
      case HashType.sha384:
        return 'sha384';
      case HashType.sha512:
        return 'sha512';
      case HashType.sha512_224:
        return 'sha512_224';
      case HashType.sha512_256:
        return 'sha512_256';
      case HashType.sha3_224:
        return 'sha3-224';
      case HashType.sha3_256:
        return 'sha3-256';
      case HashType.sha3_384:
        return 'sha3-384';
      case HashType.sha3_512:
        return 'sha3-512';
    }
  }
}
