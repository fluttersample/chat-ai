


class LoginResponseModel  {
  String? accessToken;
  String? refreshToken;
  WorkspaceModel? workspace;

  LoginResponseModel({this.accessToken, this.refreshToken, this.workspace});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    workspace = json['workspace'] != null
        ? WorkspaceModel.fromJson(json['workspace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    if (this.workspace != null) {
      data['workspace'] = this.workspace!.toJson();
    }
    return data;
  }
}

class WorkspaceModel {
  int? id;
  bool? isBase;
  bool? isDefault;
  WorkspaceModel? workspace;
  UserModel? user;
  Role? role;
  String? name;
  WorkspaceModel(
      {this.id,
        this.isBase,
        this.isDefault,
        this.workspace,
        this.name,
        this.user,
        this.role});

  WorkspaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isBase = json['is_base'];
    isDefault = json['is_default'];
    workspace = json['workspace'] != null
        ? WorkspaceModel.fromJson(json['workspace'])
        : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_base'] = this.isBase;
    data['is_default'] = this.isDefault;
    if (this.workspace != null) {
      data['workspace'] = this.workspace!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}


class UserModel {
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  bool? isActive;
  String? dateJoined;
  String? phoneNumber;
  String? description;
  bool? isVerified;
  String? profileImage;

  UserModel(
      {this.email,
        this.username,
        this.firstName,
        this.lastName,
        this.isActive,
        this.dateJoined,
        this.phoneNumber,
        this.description,
        this.isVerified,
        this.profileImage});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    phoneNumber = json['phone_number'];
    description = json['description'];
    isVerified = json['is_verified'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    data['phone_number'] = this.phoneNumber;
    data['description'] = this.description;
    data['is_verified'] = this.isVerified;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class Role {
  String? title;

  Role({this.title});

  Role.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}
