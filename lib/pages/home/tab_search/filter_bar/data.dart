// 结果数据类型
class FilterBarResult {
  final String? areaId; // 推荐排序
  final String? priceId; // 位置距离
  final String? rentTypeId; // 景点类型
  final List<String>? moreIds; // 筛选

  FilterBarResult(
      {this.areaId,
      this.priceId,
      this.rentTypeId,
      this.moreIds,
      String? priceTypeId,
      List<String>? moreId});
}

// 通用类型
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType> areaList = [
  GeneralType('销量高', '11'),
  GeneralType('距离近', '22'),
];
List<GeneralType> priceList = [
  GeneralType('1km', '22'),
  GeneralType('5km', 'aa'),
  GeneralType('10km', '33'),
];
List<GeneralType> rentTypeList = [
  GeneralType('自然风光', 'bb'),
  GeneralType('主题乐园', '22'),
  GeneralType('名胜古迹', 'cc'),
  GeneralType('野外露营', 'cc'),
];
List<GeneralType> roomTypeList = [
  GeneralType('可订今日', '11'),
  GeneralType('可订明日', '22'),
  GeneralType('免费', '22'),
];
List<GeneralType> orientedList = [
  GeneralType('5A', '99'),
  GeneralType('4A及以上', 'cc'),
];
List<GeneralType> floorList = [
  GeneralType('4.5分及以上', 'aa'),
  GeneralType('4.0分及以上', 'bb'),
];
