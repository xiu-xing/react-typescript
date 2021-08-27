import 'package:built_value/serializer.dart';

/// 对接口类型StringMap 序列化为map
class StringMapSerializer implements PrimitiveSerializer<Map<String, dynamic>> {
  @override
  Map<String, dynamic> deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    // serialized-------------- = [entity_id, 1027601078, entity_type, ORGANIZATION]
    // print("serialized-------${serialized.runtimeType}------- = $serialized");
    Map<String, dynamic> map = Map();
    if (serialized is List) {
      int len = serialized.length;
      // 取偶
      len = (len / 2).floor() * 2;
      for (int i = 0; i < len - 1; i += 2) {
        map.putIfAbsent(serialized[i].toString(), () => serialized[i + 1]);
      }
    }
    return map;
  }

  @override
  Object serialize(Serializers serializers, Map<String, dynamic> object,
      {FullType specifiedType = FullType.unspecified}) {
    // print("serializers---- = ${serializers.runtimeType}");
    // map -> list
    List<dynamic> list = [];
    object.forEach((key, value) {
      list.add(key);
      list.add(value);
    });
    return list;
  }

  @override
  Iterable<Type> get types => [Map];

  @override
  String get wireName => "StringMap";
}
