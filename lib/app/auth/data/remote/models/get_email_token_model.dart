import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';

class GetEmailTokenModel extends GetEmailTokenEntity {
  GetEmailTokenModel({required super.status, required super.message, required super.data});


  factory GetEmailTokenModel.fromJson(Map<String, dynamic> json) {
    return GetEmailTokenModel(
        status : json['status'],
        message : json['message'],
        data : json['data'] != null ? GetEmailTokenModelData.fromJson(json['data']) : null
    );
  }


}

class GetEmailTokenModelData extends GetEmailTokenEntityData {
  GetEmailTokenModelData({required super.token});

  factory GetEmailTokenModelData.fromJson(Map<String, dynamic> json) {
    return GetEmailTokenModelData(
        token : json['token']
    );
  }
}

