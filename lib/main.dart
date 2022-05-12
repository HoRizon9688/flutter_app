// 依赖
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/application.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

// 程序入口
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpProxy httpProxy = await HttpProxy.createHttpProxy();
  httpProxy.host = "192.168.1.3";// replace with your server ip
  httpProxy.port = "7890";// replace with your server port
  HttpOverrides.global=httpProxy;
  final keyApplicationId = 'BYju35wBoYzFRqkix4nynM42tJGOfuxLKMV6NBiw';
  final keyClientKey = 'WcGnhCsjpINZiP9Bci4cWBCe6GqkK9utqj6WH9UF';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(const Application());
}
