import 'package:smartpay/app/auth/domain/entities/verify_email_token_entity.dart';

class VerifyEmailTokenModel extends VerifyEmailTokenEntity {
  VerifyEmailTokenModel({required super.status, required super.message, required super.data});


  factory VerifyEmailTokenModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailTokenModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null
    );
  }
}
