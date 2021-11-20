// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences _preferences;
  static const String _usernameKey = 'username';
  static const String _uidKey = 'uid';
  static const _refreshTokenKey = "refreshToken";

  static Future initialize() async => 
    _preferences = await SharedPreferences.getInstance(); 
  
  static Future setName(String username) async => 
    await _preferences.setString(_usernameKey, username);

 static Future setUid(String uid) async => 
    await _preferences.setString(_uidKey, uid);

  static Future setRefreshToken(String refreshToken) async =>
    await _preferences.setString(_refreshTokenKey, refreshToken);
  
  static String getName() => _preferences.getString(_usernameKey);
  static String getUid() => _preferences.getString(_uidKey);
  static String getRefreshToken() => _preferences.getString(_refreshTokenKey);

  static bool isUserLoggedIn(){
    String username =  getName() ?? "";
    String uid = getUid() ?? "";
    String refreshToken = getRefreshToken() ?? "";

    if(username != "" && uid != "" && refreshToken != ""){
      return true;
    }else{
      return false;
    }
  }
 }
