class CreateAccountEntity {
  final bool? status;
  final String? message;
  final CreateAccountEntityData? data;
  final CreateAccountEntityErrors? errors;

  CreateAccountEntity({required this.errors, required this.status, required this.message, required this.data});

  factory CreateAccountEntity.fromJson(Map<String, dynamic> json) {
    return CreateAccountEntity(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? CreateAccountEntityData.fromJson(json['data']) : null,
        errors: json['errors'] != null ? CreateAccountEntityErrors.fromJson(json['errors']) : null
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

class CreateAccountEntityErrors {
  List<String>? email;
  List<String>? password;

  CreateAccountEntityErrors({required this.email, required this.password});

  factory CreateAccountEntityErrors.fromJson(Map<String, dynamic> json) {
    return CreateAccountEntityErrors(
        email: json['email']?.cast<String>(),
        password: json['password']?.cast<String>()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class CreateAccountEntityData {
  final CreateAccountEntityUser? user;
  final String? token;

  CreateAccountEntityData({required this.user, required this.token});

  factory CreateAccountEntityData.fromJson(Map<String, dynamic> json) {
    return CreateAccountEntityData(
        user: json['user'] != null ? CreateAccountEntityUser.fromJson(json['user']) : null,
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

class CreateAccountEntityUser {
  final String? fullName;
  final String? username;
  final String? email;
  final String? country;
  final String? id;

  CreateAccountEntityUser({required this.fullName, required this.username, required this.email, required this.country, required this.id});

  factory CreateAccountEntityUser.fromJson(Map<String, dynamic> json) {
    return CreateAccountEntityUser(
        fullName: json['full_name'],
        username: json['username'],
        email: json['email'],
        country: json['country'],
        id: json['id']
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['username'] = username;
    data['email'] = email;
    data['country'] = country;
    data['id'] = id;
    return data;
  }
}
