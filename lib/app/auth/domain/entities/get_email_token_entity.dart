class GetEmailTokenEntity {
  final bool? status;
  final String? message;
  final GetEmailTokenEntityData? data;

  GetEmailTokenEntity({required this.status, required this.message, required this.data});

  factory GetEmailTokenEntity.fromJson(Map<String, dynamic> json) {
    return GetEmailTokenEntity(
        status : json['status'],
        message : json['message'],
        data : json['data'] != null ? GetEmailTokenEntityData.fromJson(json['data']) : null
    );
  }

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

class GetEmailTokenEntityData {
  final String? token;
  GetEmailTokenEntityData({required this.token});

  factory GetEmailTokenEntityData.fromJson(Map<String, dynamic> json) {
    return GetEmailTokenEntityData(
        token : json['token']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }

}
