class LoginEntity {
  final bool? status;
  final String? message;
  final LoginEntityData? data;
  final LoginEntityErrors? errors;

  LoginEntity({required this.status, required this.message, required this.data, required this.errors});

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    return LoginEntity(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? LoginEntityData.fromJson(json['data']) : null,
        errors: json['errors'] != null ? LoginEntityErrors.fromJson(json['errors']) : null
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class LoginEntityData {
  final LoginEntityUser? user;
  final String? token;

  LoginEntityData({required this.user, required this.token});

  factory LoginEntityData.fromJson(Map<String, dynamic> json) {
    return LoginEntityData(
        user: json['user'] != null ? LoginEntityUser.fromJson(json['user']) : null,
        token: json['token']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class LoginEntityUser {
  final String? id;
  final String? fullName;
  final String? username;
  final String? email;
  final String? phone;
  final String? phoneCountry;
  final String? country;
  final String? avatar;

  LoginEntityUser(
      {required this.id,
        required this.fullName,
        required this.username,
        required this.email,
        required this.phone,
        required this.phoneCountry,
        required this.country,
        required this.avatar});

  factory LoginEntityUser.fromJson(Map<String, dynamic> json) {
    return LoginEntityUser(
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['phone_country'] = phoneCountry;
    data['country'] = country;
    data['avatar'] = avatar;
    return data;
  }
}

class LoginEntityErrors {
  final List<String>? email;

  LoginEntityErrors({required this.email});

  factory LoginEntityErrors.fromJson(Map<String, dynamic> json) {
    return LoginEntityErrors(email: json['email']?.cast<String>());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
