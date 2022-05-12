// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hook_up_rent/routes/app_pages.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(model:AuthModel(),
        child: ScopedModel<FilterBarModel>(
        model:FilterBarModel(),
        child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.light,
        primaryColor: Colors.red),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routePages,
        ),
        )
      );
      }

    }
