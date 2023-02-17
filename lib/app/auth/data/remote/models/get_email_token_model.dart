import 'package:smartpay/app/auth/domain/entities/get_email_token_entity.dart';

class GetEmailTokenModel extends GetEmailTokenEntity {

  GetEmailTokenModel({
    final bool? status,
    final String? message,
    final GetEmailTokenModelData? data
  }) : super(status: false, message: message, data: data);

  factory GetEmailTokenModel.fromJson(Map<String, dynamic> json) {
    return GetEmailTokenModel(
        status : json['status'],
        message : json['message'],
        data : json['data'] != null ? GetEmailTokenModelData.fromJson(json['data']) : null
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetEmailTokenModelData extends GetEmailTokenEntityData {
  GetEmailTokenModelData({final String? token}) : super(token: token);

  factory GetEmailTokenModelData.fromJson(Map<String, dynamic> json) {
    return GetEmailTokenModelData(
        token : json['token']
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}

