import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/register.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../scoped_model/auth.dart';
import '../utils/store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[200], title: const Text('登录')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: controllerUsername,
            enabled: !isLoggedIn,
            decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: controllerPassword,
            enabled: !isLoggedIn,
            obscureText: !_showPassword,
            decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                suffixIcon: IconButton(
                    color: Colors.blue[100],
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(_showPassword
                        ? Icons.visibility_off
                        : Icons.visibility))),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          ElevatedButton(
            child: const Text('登录'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xffEDFCF5))),
            onPressed: isLoggedIn ? null : () => doUserLogin(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('还没有账号，'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
                  },
                  child: const Text('去注册~'))
            ],
          ),
        ]),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password,null);

    var response = await user.login();

    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    String? token = currentUser?.sessionToken;

    Store store = await Store.getInstance();
    await store.setString(StoreKeys.token, token!);
    ScopedModelHelper.getModel<AuthModel>(context).login(token,context);
    // var resMap = json.decode(response.toString());
    // int status = resMap['status'];
    // String description = resMap['description'] ?? '内部错误';
    //
    // if (status.toString().startsWith('2')){
    //   String token = resMap['body']['token'];
    //
    //   Store store = await Store.getInstance();
    //   await store.setString(StoreKeys.token, token);
    //
    //   ScopedModelHelper.getModel<AuthModel>(context).login(token,context);
    // }

    if (response.success) {
      Message.showSuccess(
          context: context,
          message: '登录成功！',
          onPressed: () async {
            Navigator.of(context).pop();
          });
    } else {
      Message.showError(context: context,
          message: response.error!.message);
    }
  }
}

Future<bool> hasUserLogged() async {
  ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
  if (currentUser == null) {
    return false;
  }
  //Checks whether the user's session token is valid
  final ParseResponse? parseResponse =
  await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

  if (parseResponse?.success == null || !parseResponse!.success) {
    //Invalid session. Logout
    await currentUser.logout();
    return false;
  } else {
    return true;
  }
}



class Message {
  static void showSuccess(
      {required BuildContext context,
        required String message,
        VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
             ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void showError(
      {required BuildContext context,
        required String message,
        VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(message),
          actions: <Widget>[
             ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

