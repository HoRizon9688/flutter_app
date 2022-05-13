import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../utils/store.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
class AuthModel extends Model {
  String _token = '';
  late UserInfo _userInfo;

  String get token => _token;
  UserInfo get userInfo => _userInfo;

  bool get isLogin => _token is String && _token != '';

  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);
    if (!stringIsNullOrEmpty(token)) {
      login(token, context);
    }
  }


  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();
  }

  void logout() {
    _token = '';
    notifyListeners();
  }
}
