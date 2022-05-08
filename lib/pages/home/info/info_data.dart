// 数据准备,注意下面的格式

class InfoItem {
  final String title;
  final String imageUrl;
  final String times;
  final String price;
  final String navigateUrl;

  const InfoItem(
      this.title, this.imageUrl, this.times, this.price, this.navigateUrl);
}

const List<InfoItem> infoData = [
  InfoItem(
      '长江索道',
      'http://imgbdb3.bendibao.com/cqbdb/tour/20197/11/2019711101218_42887.jpg',
      "已拼38次",
      "30",
      'login'),
  InfoItem(
      '重庆欢乐谷',
      'https://res.cqnews.net/ires/2021/5/2/XtAhpxIUjJi8MHcvL5kEAuX3OMYuGFGnoRl.jpg',
      "已拼158次",
      "100",
      'login'),
  InfoItem(
      '磁器口古镇',
      'http://5b0988e595225.cdn.sohucs.com/images/20190130/5bf3da0e3cb240968ac009242988ef4b.jpeg',
      "需提前预约",
      "0",
      'login'),
  InfoItem(
      '重庆湖畔星空里长寿湖露营地',
      'http://img.mp.itc.cn/upload/20170330/a3b1c6670a08424497896bcbad674dd0_th.jpg',
      "已拼45次",
      "298",
      'login'),
  InfoItem(
      '乌江画廊',
      'http://5b0988e595225.cdn.sohucs.com/images/20190327/6aafa4f83fd54431b33d1f1d9ddf1591.png',
      "已拼26次",
      "135",
      'login'),
];
