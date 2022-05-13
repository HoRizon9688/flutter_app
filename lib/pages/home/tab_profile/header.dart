import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

var loginRegisterStyle = const TextStyle(fontSize: 20, color: Colors.white);

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }

  Container _notLoginBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      height: 95,
      decoration: const BoxDecoration(color: Colors.blueGrey),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'login'),
                    child: Text('登录', style: loginRegisterStyle),
                  ),
                  Text(' / ', style: loginRegisterStyle),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'register'),
                    child: Text('注册', style: loginRegisterStyle),
                  ),
                ],
              ),
              const Text(
                '登录后可以体验更多',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
  // _getUserInfo(BuildContext context) async {
  //   ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
  //   String? Username = currentUser?.username;
  //   String? Email = currentUser?.emailAddress;
  // }
  //Reading your First Data Object from Back4App
  // Future<Map<String, dynamic>> getPerson(String objectId) async {
  //   QueryBuilder<ParseObject> queryPerson =
  //   QueryBuilder<ParseObject>(ParseObject('Person'))
  //     ..whereEqualTo('objectId', objectId);
  //   final ParseResponse apiResponse = await queryPerson.query();
  //   if (apiResponse.success && apiResponse.results != null) {
  //     final name = apiResponse.results?.first.get<String>('name');
  //     final age = apiResponse.results?.first.get<String>('age');
  //     return {'name': name, 'age': age};
  //   } else {
  //     return {};
  //   }
  // }


  Container _loginBuilder(BuildContext context) {
    _getUserInfo(BuildContext context) async {
      ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
      String? Username = currentUser?.username;
      String? Email = currentUser?.emailAddress;
    }
    String userName = '';
    String userImage =
        'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg';

    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      height: 95,
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Container(
              height: 65,
              width: 65,
              margin: const EdgeInsets.only(right: 15),
              child: CircleAvatar(backgroundImage: NetworkImage(userImage))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                userName,
                style: loginRegisterStyle,
              ),
              const Text(
                '查看编辑个人资料',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
  Future<List<ParseObject>> getTodo() async {
    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('Todo'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

}
