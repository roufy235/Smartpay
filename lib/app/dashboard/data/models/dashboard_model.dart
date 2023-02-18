import 'package:smartpay/app/dashboard/domain/entities/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({required super.status, required super.message, required super.data});


  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? DashboardModelData.fromJson(json['data']) : null
    );
  }

}

class DashboardModelData  extends DashboardEntityData{
  DashboardModelData({required super.secret});

  factory DashboardModelData.fromJson(Map<String, dynamic> json) {
    return DashboardModelData(secret: json['secret']);
  }

}
