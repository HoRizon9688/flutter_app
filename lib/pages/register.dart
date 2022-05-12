import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hook_up_rent/apis/request_api.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:io';
import 'package:http_proxy/http_proxy.dart';

// class RegisterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage_2(),
//     );
//   }
// }
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// class HomePage_2 extends StatefulWidget {
//   @override
//   _HomePage_2State createState() => _HomePage_2State();
// }

class _RegisterPageState extends State<RegisterPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: controllerUsername,
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: controllerPassword,
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: controllerEmail,
              decoration: const InputDecoration(
                labelText: '邮箱',
                hintText: '请输入邮箱',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => doUserRegistration(),
              child: const Text('注册'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('已有账号，'),
                TextButton(
                  child: const Text('去登录~'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("注册成功!"),
          actions: <Widget>[
            FlatButton(
              child: const Text("ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    String message = '';
    String a = 'Account';
    String b = 'Email';
    if (errorMessage.startsWith(a)) {
      message = '该账号已被注册!';
    }
    if (errorMessage.startsWith(b)) {
      message = '邮箱格式不正确！';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text("Error!"),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: const Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
      //Sigup code here
    }
  }
}
