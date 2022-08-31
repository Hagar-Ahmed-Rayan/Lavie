/// type : "Success"
/// message : "Logged in Successfully"
/// data : {"user":{"userId":"66803566-c1ee-4a30-bc94-4970ad63c98d","firstName":"hagar","lastName":"rayan","email":"hagarrayan123@gmail.com","imageUrl":"https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png","address":null,"role":"user"},"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjgwMzU2Ni1jMWVlLTRhMzAtYmM5NC00OTcwYWQ2M2M5OGQiLCJpYXQiOjE2NjA1OTQ5NDAsImV4cCI6MTY2MDc2Nzc0MH0.ats97HDASgMlBwANfjPgiw_DfnbRrS2Koo6b9iVSXjw","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjgwMzU2Ni1jMWVlLTRhMzAtYmM5NC00OTcwYWQ2M2M5OGQiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjA1OTQ5NDAsImV4cCI6MTY2MTE5OTc0MH0.MkCLs77run0m4Te7xoTVdDyikGjA18Ak1dowoKrX66Y"}

class LognModel {
  LognModel({
      dynamic? type, 
      dynamic? message, 
      Data? data,
  })
  {
    _type = type;
    _message = message;
    _data = data;
}

  LognModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  dynamic? _type;
  dynamic? _message;
  Data? _data;
LognModel copyWith({  dynamic? type,
  dynamic? message,
  Data? data,
}) => LognModel(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  dynamic? get type => _type;
  dynamic? get message => _message;
  Data? get data => _data;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user : {"userId":"66803566-c1ee-4a30-bc94-4970ad63c98d","firstName":"hagar","lastName":"rayan","email":"hagarrayan123@gmail.com","imageUrl":"https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png","address":null,"role":"user"}
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjgwMzU2Ni1jMWVlLTRhMzAtYmM5NC00OTcwYWQ2M2M5OGQiLCJpYXQiOjE2NjA1OTQ5NDAsImV4cCI6MTY2MDc2Nzc0MH0.ats97HDASgMlBwANfjPgiw_DfnbRrS2Koo6b9iVSXjw"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjgwMzU2Ni1jMWVlLTRhMzAtYmM5NC00OTcwYWQ2M2M5OGQiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjA1OTQ5NDAsImV4cCI6MTY2MTE5OTc0MH0.MkCLs77run0m4Te7xoTVdDyikGjA18Ak1dowoKrX66Y"

class Data {
  Data({
      User? user, 
      dynamic? accessToken, 
      dynamic? refreshToken,}){
    _user = user;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }
  User? _user;
  dynamic? _accessToken;
  dynamic? _refreshToken;
Data copyWith({  User? user,
  dynamic? accessToken,
  dynamic? refreshToken,
}) => Data(  user: user ?? _user,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  User? get user => _user;
  dynamic? get accessToken => _accessToken;
  dynamic? get refreshToken => _refreshToken;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }

}

/// userId : "66803566-c1ee-4a30-bc94-4970ad63c98d"
/// firstName : "hagar"
/// lastName : "rayan"
/// email : "hagarrayan123@gmail.com"
/// imageUrl : "https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png"
/// address : null
/// role : "user"

class User {
  User({
      dynamic? userId, 
      dynamic? firstName, 
      dynamic? lastName, 
      dynamic? email, 
      dynamic? imageUrl, 
      dynamic address, 
      dynamic? role,}){
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _address = address;
    _role = role;
}

  User.fromJson(dynamic json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _address = json['address'];
    _role = json['role'];
  }
  dynamic? _userId;
  dynamic? _firstName;
  dynamic? _lastName;
  dynamic? _email;
  dynamic? _imageUrl;
  dynamic _address;
  dynamic? _role;
User copyWith({  dynamic? userId,
  dynamic? firstName,
  dynamic? lastName,
  dynamic? email,
  dynamic? imageUrl,
  dynamic address,
  dynamic? role,
}) => User(  userId: userId ?? _userId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  imageUrl: imageUrl ?? _imageUrl,
  address: address ?? _address,
  role: role ?? _role,
);
  dynamic? get userId => _userId;
  dynamic? get firstName => _firstName;
  dynamic? get lastName => _lastName;
  dynamic? get email => _email;
  dynamic? get imageUrl => _imageUrl;
  dynamic get address => _address;
  dynamic? get role => _role;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['userId'] = _userId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['imageUrl'] = _imageUrl;
    map['address'] = _address;
    map['role'] = _role;
    return map;
  }

}