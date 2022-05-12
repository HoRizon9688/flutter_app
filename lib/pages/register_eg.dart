// import 'package:flutter/material.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
// import 'dart:io';
// import 'package:http_proxy/http_proxy.dart';
//
//
// class RegisterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter SignUp',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage2(),
//     );
//   }
// }
//
// class HomePage2 extends StatefulWidget {
//   @override
//   _HomePageState2 createState() => _HomePageState2();
// }
//
// class _HomePageState2 extends State<HomePage2> {
//   final controllerUsername = TextEditingController();
//   final controllerPassword = TextEditingController();
//   final controllerEmail = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter SignUp'),
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   height: 200,
//                   child: Image.network(
//                       'http://blog.back4app.com/wp-content/uploads/2017/11/logo-b4a-1-768x175-1.png'),
//                 ),
//                 Center(
//                   child: const Text('Flutter on Back4App',
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Center(
//                   child: const Text('User registration',
//                       style: TextStyle(fontSize: 16)),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 TextField(
//                   controller: controllerUsername,
//                   keyboardType: TextInputType.text,
//                   textCapitalization: TextCapitalization.none,
//                   autocorrect: false,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black)),
//                       labelText: 'Username'),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 TextField(
//                   controller: controllerEmail,
//                   keyboardType: TextInputType.emailAddress,
//                   textCapitalization: TextCapitalization.none,
//                   autocorrect: false,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black)),
//                       labelText: 'E-mail'),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 TextField(
//                   controller: controllerPassword,
//                   obscureText: true,
//                   keyboardType: TextInputType.text,
//                   textCapitalization: TextCapitalization.none,
//                   autocorrect: false,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black)),
//                       labelText: 'Password'),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Container(
//                   height: 50,
//                   child: TextButton(
//                     child: const Text('Sign Up'),
//                     onPressed: () => doUserRegistration(),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
//
//
//   void showSuccess() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("注册成功!"),
//           actions: <Widget>[
//             FlatButton(
//               child: const Text("去登录"),
//               onPressed: () {
//                 Navigator.of(context).pushReplacementNamed('login');
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//
//
//   void showError(String errorMessage) {
//     String message = '';
//     String a = 'Account';
//     String b = 'Email';
//     if (errorMessage.startsWith(a)) {
//       message = '该账号已被注册!';
//     }
//     if (errorMessage.startsWith(b)) {
//       message = '邮箱格式不正确！';
//     }
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           // title: const Text("Error!"),
//           content: Text(message),
//           actions: <Widget>[
//              FlatButton(
//               child: const Text("ok"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   void doUserRegistration() async {
//     final username = controllerUsername.text.trim();
//     final email = controllerEmail.text.trim();
//     final password = controllerPassword.text.trim();
//
//     final user = ParseUser.createUser(username, password, email);
//
//     var response = await user.signUp();
//
//     if (response.success) {
//       showSuccess();
//     } else {
//       showError(response.error!.message);
//       //Sigup code here
//     }
//   }
// }
