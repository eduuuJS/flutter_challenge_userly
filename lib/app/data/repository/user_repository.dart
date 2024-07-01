import 'package:get/get.dart';
import 'package:userly/app/data/dtos/response_user_dto.dart';
import 'package:userly/app/domain/user.dart';
import 'package:userly/core/network/dio_client.dart';

abstract class IUserRepository {
  Future<List<User>> getUsers();
  Future<bool> createUser(User user);
  Future<bool> updateUser(int id, User user);
  Future<bool> deleteUser(int id);
}

class UserRepository implements IUserRepository {
  final _dioClient = Get.find<DioClient>();

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await _dioClient.get(
        path: '/users',
      );
      if (response.statusCode == 200) {
        return ResponseUserDto.fromJson({
          "userDto": response.data,
        }).toModel();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> createUser(User user) async {
    try {
      final response = await _dioClient.post(path: '/users');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateUser(int id, User user) async {
    try {
      final response = await _dioClient.put(path: '/users/$id');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteUser(int id) async {
    try {
      final response = await _dioClient.delete(
        path: '/users/$id',
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
