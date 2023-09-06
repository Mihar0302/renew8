

class LoginData {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final int gender;
  final String address;
  final String country;
  final String state;
  final String city;
  final String profileImage;
  final String token;

  LoginData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.profileImage,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.token,
  });

  factory LoginData.fromJson(Map json) => LoginData(
        id: json["id"] ?? "",
        firstName: json['first_name'] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        mobile: json["mobile"] ?? "",
        gender: json["gender"] ?? 0,
        profileImage: json["address"] ?? "",
        address: json["country"] ?? "",
        country: json["state"] ?? "",
        state: json["city"] ?? "",
        city: json["profile_image"] ?? "",
        token: json["token"] ?? "",
      );
}

class LoginDataToken {
  LoginData? loginData;

  LoginDataToken({required this.loginData});

  factory LoginDataToken.fromJson(Map<String, dynamic> json) => LoginDataToken(
        loginData: json["data"],
      );
}

class LoginDataPost {
  final String email;
  final String password;
  final String deviceType;
  final String fcmToken;

  LoginDataPost({
    required this.email,
    required this.password,
    required this.deviceType,
    required this.fcmToken,
  });

  Map toJson() => {
        "username": email,
        "password": password,
        "device_type": deviceType,
        "device_token": fcmToken,
      };
}

class Login{
  final data;
  Login({required this.data});

  factory Login.fromJson(Map json) => Login(
    data: json["data"] ?? {},
  );

}