import 'package:userly/core/environment/environment.dart';

class AppConfig {
  static void initialize() {
    Environment.type = ENV.dev;
  }
}
