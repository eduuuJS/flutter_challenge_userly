import 'package:userly/app/domain/user.dart';
import 'package:userly/core/utils/helpers.dart';

class ResponseUserDto {
  List<UserDto>? userDto;

  ResponseUserDto({
    this.userDto,
  });

  factory ResponseUserDto.fromJson(Map<String, dynamic> json) =>
      ResponseUserDto(
        userDto: json["userDto"] == null
            ? []
            : List<UserDto>.from(
                json["userDto"]!.map((x) => UserDto.fromJson(x))),
      );

  List<User> toModel() {
    return userDto?.map((e) => e.toModel()).toList() ?? [];
  }
}

class UserDto {
  int? id;
  String? name;
  String? username;
  String? email;
  AddressDto? addressDto;
  String? phone;
  String? website;
  CompanyDto? companyDto;

  UserDto({
    this.id,
    this.name,
    this.username,
    this.email,
    this.addressDto,
    this.phone,
    this.website,
    this.companyDto,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        addressDto: json["address"] == null
            ? null
            : AddressDto.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        companyDto: json["company"] == null
            ? null
            : CompanyDto.fromJson(json["company"]),
      );

  User toModel() {
    return User(
      uuid: Helpers.generateId(),
      name: name ?? '',
      username: username ?? '',
      id: id ?? 0,
      email: email ?? '',
      phone: phone ?? '',
      website: website ?? '',
    );
  }
}

class AddressDto {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoDto? geoDto;

  AddressDto({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geoDto,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) => AddressDto(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geoDto: json["geo"] == null ? null : GeoDto.fromJson(json["geo"]),
      );
}

class GeoDto {
  String? lat;
  String? lng;

  GeoDto({
    this.lat,
    this.lng,
  });

  factory GeoDto.fromJson(Map<String, dynamic> json) => GeoDto(
        lat: json["lat"],
        lng: json["lng"],
      );
}

class CompanyDto {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyDto({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory CompanyDto.fromJson(Map<String, dynamic> json) => CompanyDto(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );
}
