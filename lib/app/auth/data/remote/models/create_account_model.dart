import 'package:smartpay/app/auth/domain/entities/create_account_entity.dart';

class CreateAccountModel extends CreateAccountEntity {
  CreateAccountModel({required super.status, required super.message, required super.data, required super.errors});


  factory CreateAccountModel.fromJson(Map<String, dynamic> json) {
    return CreateAccountModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? CreateAccountModelData.fromJson(json['data']) : null,
        errors: json['errors'] != null ? CreateAccountEntityErrors.fromJson(json['errors']) : null
    );
  }

}

class CreateAccountModelErrors extends CreateAccountEntityErrors {
  CreateAccountModelErrors({required super.email, required super.password});

  factory CreateAccountModelErrors.fromJson(Map<String, dynamic> json) {
    return CreateAccountModelErrors(
        email: json['email']?.cast<String>(),
        password: json['password']?.cast<String>()
    );
  }

}

class CreateAccountModelData extends CreateAccountEntityData {
  CreateAccountModelData({required super.user, required super.token});

  factory CreateAccountModelData.fromJson(Map<String, dynamic> json) {
    return CreateAccountModelData(
        user: json['user'] != null ? CreateAccountModelUser.fromJson(json['user']) : null,
        token: json['token']
    );
  }

}

class CreateAccountModelUser extends CreateAccountEntityUser {
  CreateAccountModelUser({required super.fullName, required super.username, required super.email, required super.country, required super.id});


  factory CreateAccountModelUser.fromJson(Map<String, dynamic> json) {
    return CreateAccountModelUser(
        fullName: json['full_name'],
        username: json['username'],
        email: json['email'],
        country: json['country'],
        id: json['id']
    );

  }

}
