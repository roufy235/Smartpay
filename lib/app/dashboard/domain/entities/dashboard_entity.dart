class DashboardEntity {
  final bool? status;
  final String? message;
  final DashboardEntityData? data;

  DashboardEntity({required this.status, required this.message, required this.data});

  factory DashboardEntity.fromJson(Map<String, dynamic> json) {
    return DashboardEntity(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? DashboardEntityData.fromJson(json['data']) : null
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

class DashboardEntityData {
  final String? secret;

  DashboardEntityData({required this.secret});

  factory DashboardEntityData.fromJson(Map<String, dynamic> json) {
    return DashboardEntityData(secret: json['secret']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['secret'] = secret;
    return data;
  }
}
