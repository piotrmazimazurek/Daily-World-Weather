import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: 'locks.env')
abstract class Env {
  @EnviedField(varName: 'key2', obfuscate: true)
  static final key2 = _Env.key2;
}
