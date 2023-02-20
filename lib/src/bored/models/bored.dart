import 'package:json_annotation/json_annotation.dart';
part 'bored.g.dart';

@JsonSerializable()
class Bored {
  const Bored({
    this.activity = '',
    this.type = '',
    this.participants = 0,
    this.price = 0,
    this.accessibility = 0,
    this.link = '',
  });

  factory Bored.fromJson(Map<String, dynamic> json) => _$BoredFromJson(json);
  Map<String, dynamic> toJson() => _$BoredToJson(this);

  final String activity;
  final String type;
  final int participants;
  final double price;
  final double accessibility;
  final String link;

  static const empty = Bored();
}
