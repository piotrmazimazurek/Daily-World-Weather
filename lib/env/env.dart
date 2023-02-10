import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lock.env')
abstract class Env {
  @EnviedField(varName: 'key1', obfuscate: true)
  static final key1 = _Env.key1;
}
