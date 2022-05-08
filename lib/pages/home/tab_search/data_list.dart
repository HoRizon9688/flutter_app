// 搜索页数据准备
class RoomListItemData {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final List<String> tags;
  final String price;

  const RoomListItemData(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      required this.tags,
      required this.price});
}

const List<RoomListItemData> dataList = [
  RoomListItemData(
      title: '重庆两江游',
      subTitle: "4.5分 3219条点评",
      imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
      price: '30',
      id: '1',
      tags: ["亲子同乐", "可订今日", "08:00-22:00开放"]),
  RoomListItemData(
      title: '洪崖洞民俗风貌区',
      subTitle: "4.5分 3829条点评",
      imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
      price: '0',
      id: '3',
      tags: ["可订今日", "亲子同乐"]),
  RoomListItemData(
      title: '欢乐海底世界',
      subTitle: "4.6分 1593条点评",
      imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
      price: '120',
      id: '2',
      tags: ["可订明日", "亲子同乐", "09:00-17:00开放"])
//   RoomListItemData(
//       title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
//       subTitle: "一室/110/西/CBD总部公寓二期",
//       imageUrl:
//           "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
//       price: 6000,
//       id: '41',
//       tags: ["近地铁", "随时看房"]),
 ];
