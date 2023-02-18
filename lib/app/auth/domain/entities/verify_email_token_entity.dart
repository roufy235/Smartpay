class VerifyEmailTokenEntity {
  final bool? status;
  final String? message;
  final Data? data;

  VerifyEmailTokenEntity({required this.status, required this.message, required this.data});

  factory VerifyEmailTokenEntity.fromJson(Map<String, dynamic> json) {
    return VerifyEmailTokenEntity(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null
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

class Data {
  final String? email;

  Data({required this.email});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      email: json['email']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
