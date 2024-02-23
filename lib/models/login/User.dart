import 'Location.dart';
import 'Roles.dart';
import 'Campus.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      Location? location, 
      String? gender, 
      String? phone, 
      String? occupation, 
      String? maritalStatus, 
      List<String>? deviceToken, 
      List<Roles>? roles, 
      List<String>? permissions, 
      dynamic activationCode, 
      bool? isActive, 
      bool? isSuspended, 
      bool? isDeleted, 
      bool? online, 
      bool? bornAgain, 
      dynamic firebaseUid, 
      String? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? username, 
      dynamic activationExpiresIn, 
      String? createdAt, 
      String? updatedAt, 
      Campus? campus, 
      String? profilePicture, 
      num? notificationCounter
  }){
    _location = location;
    _gender = gender;
    _phone = phone;
    _occupation = occupation;
    _maritalStatus = maritalStatus;
    _deviceToken = deviceToken;
    _roles = roles;
    _permissions = permissions;
    _activationCode = activationCode;
    _isActive = isActive;
    _isSuspended = isSuspended;
    _isDeleted = isDeleted;
    _online = online;
    _bornAgain = bornAgain;
    _firebaseUid = firebaseUid;
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _username = username;
    _activationExpiresIn = activationExpiresIn;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _campus = campus;
    _profilePicture = profilePicture;
    _notificationCounter = notificationCounter;
    _id = id;
}

  User.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _gender = json['gender'];
    _phone = json['phone'];
    _occupation = json['occupation'];
    _maritalStatus = json['marital_status'];
    _deviceToken = json['device_token'] != null ? json['device_token'].cast<String>() : [];
    if (json['roles'] != null) {
      _roles = [];
      json['roles'].forEach((v) {
        _roles?.add(Roles.fromJson(v));
      });
    }
    _permissions = json['permissions'] != null ? json['permissions'].cast<String>() : [];
    _activationCode = json['activation_code'];
    _isActive = json['isActive'];
    _isSuspended = json['isSuspended'];
    _isDeleted = json['isDeleted'];
    _online = json['online'];
    _bornAgain = json['bornAgain'];
    _firebaseUid = json['firebase_uid'];
    _id = json['_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _username = json['username'];
    _activationExpiresIn = json['activation_expires_in'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _campus = json['campus'] != null ? Campus.fromJson(json['campus']) : null;
    _profilePicture = json['profile_picture'];
    _notificationCounter = json['notification_counter'];
    _id = json['id'];
  }
  Location? _location;
  String? _gender;
  String? _phone;
  String? _occupation;
  String? _maritalStatus;
  List<String>? _deviceToken;
  List<Roles>? _roles;
  List<String>? _permissions;
  dynamic _activationCode;
  bool? _isActive;
  bool? _isSuspended;
  bool? _isDeleted;
  bool? _online;
  bool? _bornAgain;
  dynamic _firebaseUid;
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _username;
  dynamic _activationExpiresIn;
  String? _createdAt;
  String? _updatedAt;
  Campus? _campus;
  String? _profilePicture;
  num? _notificationCounter;
User copyWith({  Location? location,
  String? gender,
  String? phone,
  String? occupation,
  String? maritalStatus,
  List<String>? deviceToken,
  List<Roles>? roles,
  List<String>? permissions,
  dynamic activationCode,
  bool? isActive,
  bool? isSuspended,
  bool? isDeleted,
  bool? online,
  bool? bornAgain,
  dynamic firebaseUid,
  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? username,
  dynamic activationExpiresIn,
  String? createdAt,
  String? updatedAt,
  Campus? campus,
  String? profilePicture,
  num? notificationCounter,
}) => User(  location: location ?? _location,
  gender: gender ?? _gender,
  phone: phone ?? _phone,
  occupation: occupation ?? _occupation,
  maritalStatus: maritalStatus ?? _maritalStatus,
  deviceToken: deviceToken ?? _deviceToken,
  roles: roles ?? _roles,
  permissions: permissions ?? _permissions,
  activationCode: activationCode ?? _activationCode,
  isActive: isActive ?? _isActive,
  isSuspended: isSuspended ?? _isSuspended,
  isDeleted: isDeleted ?? _isDeleted,
  online: online ?? _online,
  bornAgain: bornAgain ?? _bornAgain,
  firebaseUid: firebaseUid ?? _firebaseUid,
  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  username: username ?? _username,
  activationExpiresIn: activationExpiresIn ?? _activationExpiresIn,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  campus: campus ?? _campus,
  profilePicture: profilePicture ?? _profilePicture,
  notificationCounter: notificationCounter ?? _notificationCounter,
);
  Location? get location => _location;
  String? get gender => _gender;
  String? get phone => _phone;
  String? get occupation => _occupation;
  String? get maritalStatus => _maritalStatus;
  List<String>? get deviceToken => _deviceToken;
  List<Roles>? get roles => _roles;
  List<String>? get permissions => _permissions;
  dynamic get activationCode => _activationCode;
  bool? get isActive => _isActive;
  bool? get isSuspended => _isSuspended;
  bool? get isDeleted => _isDeleted;
  bool? get online => _online;
  bool? get bornAgain => _bornAgain;
  dynamic get firebaseUid => _firebaseUid;
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get username => _username;
  dynamic get activationExpiresIn => _activationExpiresIn;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Campus? get campus => _campus;
  String? get profilePicture => _profilePicture;
  num? get notificationCounter => _notificationCounter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['occupation'] = _occupation;
    map['marital_status'] = _maritalStatus;
    map['device_token'] = _deviceToken;
    if (_roles != null) {
      map['roles'] = _roles?.map((v) => v.toJson()).toList();
    }
    map['permissions'] = _permissions;
    map['activation_code'] = _activationCode;
    map['isActive'] = _isActive;
    map['isSuspended'] = _isSuspended;
    map['isDeleted'] = _isDeleted;
    map['online'] = _online;
    map['bornAgain'] = _bornAgain;
    map['firebase_uid'] = _firebaseUid;
    map['_id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['username'] = _username;
    map['activation_expires_in'] = _activationExpiresIn;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_campus != null) {
      map['campus'] = _campus?.toJson();
    }
    map['profile_picture'] = _profilePicture;
    map['notification_counter'] = _notificationCounter;
    map['id'] = _id;
    return map;
  }

}