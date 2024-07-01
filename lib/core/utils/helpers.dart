import 'package:uuid/uuid.dart';

abstract class Helpers {
  static Uuid uuid = const Uuid();

  static String generateId() {
    return uuid.v4();
  }
}
