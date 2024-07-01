import 'package:get/get.dart';
import 'package:userly/app/data/repository/user_repository.dart';
import 'package:userly/core/network/dio_client.dart';

class DependencyInjection {
  static void initialize() {
    //NETWORK
    Get.lazyPut<DioClient>(() => DioClient(), fenix: true);

    //REPOSITORIES
    Get.lazyPut<IUserRepository>(
      () => UserRepository(),
      fenix: true,
    );
  }
}
