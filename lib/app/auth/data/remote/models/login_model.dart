import 'package:smartpay/app/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.status, required super.message, required super.data, required super.errors});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? LoginModelData.fromJson(json['data']) : null,
        errors: json['errors'] != null ? LoginModelErrors.fromJson(json['errors']) : null
    );
  }

}

class LoginModelErrors extends LoginEntityErrors {
  LoginModelErrors({required super.email});

  factory LoginModelErrors.fromJson(Map<String, dynamic> json) {
    return LoginModelErrors(email: json['email']?.cast<String>());
  }
}

class LoginModelUser extends LoginEntityUser {
  LoginModelUser({required super.id, required super.fullName, required super.username, required super.email, required super.phone, required super.phoneCountry, required super.country, required super.avatar});

  factory LoginModelUser.fromJson(Map<String, dynamic> json) {
    return LoginModelUser(
        id: json['id'],
        fullName: json['full_name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        phoneCountry: json['phone_country'],
        country: json['country'],
        avatar: json['avatar']
    );
  }

}

class LoginModelData extends LoginEntityData {
  LoginModelData({required super.user, required super.token});

  factory LoginModelData.fromJson(Map<String, dynamic> json) {
    return LoginModelData(
        user: json['user'] != null ? LoginModelUser.fromJson(json['user']) : null,
        token: json['token']
    );
  }
}
