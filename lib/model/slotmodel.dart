import 'dart:convert';

class SlotModel {
  bool slotOne;

  bool slotTwo;

  SlotModel({
    required this.slotOne,
    required this.slotTwo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slot1': slotOne,
      'slot2': slotTwo,
    };
  }

  factory SlotModel.fromMap(Map<String, dynamic> map) {
    return SlotModel(
      slotOne: map['slot1'] as bool,
      slotTwo: map['slot2'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SlotModel.fromJson(String source) =>
      SlotModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
