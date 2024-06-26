import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'GRAPHQL_URL', defaultValue: '')
  static String graphqlUrl = _Env.graphqlUrl;
  @EnviedField(varName: 'BACKEND_URL', defaultValue: '')
  static String backendUrl = _Env.backendUrl;
}
