import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/user_feature/data/models/user_model.dart';
import '../../features/user_feature/domain/entities/user.dart';

const String prefsUserKey = "prefsUserKey";
const String prefsIsFirstTimeKey = "prefsIsFirstTimeKey";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> toggleIsFirstTimeOpen() => _sharedPreferences.setBool(
        prefsIsFirstTimeKey,
        !isFirstTimeOpen,
      );

  bool get isFirstTimeOpen =>
      _sharedPreferences.getBool(prefsIsFirstTimeKey) ?? true;

  Future<void> saveUserData(User user) async {
    await _sharedPreferences.setString(
      prefsUserKey,
      jsonEncode(
        user.toSharedPrefs(),
      ),
    );
  }

  User? getUser() {
    final user = _sharedPreferences.getString(prefsUserKey);
    if (user == null) {
      return null;
    }
    return UserModel.fromJson(
      jsonDecode(user),
    );
  }

  Future<void> removeUser() async => _sharedPreferences.remove(prefsUserKey);
}
