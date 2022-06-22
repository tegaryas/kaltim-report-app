import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_payload_model.g.dart';

enum ActionType { url, screen, unknown }

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class NotificationPayloadModel extends Equatable {
  @JsonKey(
      defaultValue: ActionType.unknown, unknownEnumValue: ActionType.unknown)
  final ActionType actionType;
  final String params;
  @JsonKey(fromJson: _playSoundFromJson)
  final bool playSound;
  @JsonKey(fromJson: _showForegroundFromJson)
  final bool showForeground;

  static bool _playSoundFromJson(dynamic data) {
    return data == "yes" || data == true;
  }

  static bool _showForegroundFromJson(dynamic data) {
    if (data == null) {
      return true;
    } else {
      return data == "yes" || data == true;
    }
  }

  const NotificationPayloadModel(
      {required this.actionType,
      required this.params,
      required this.playSound,
      required this.showForeground});

  factory NotificationPayloadModel.fromString(String data) {
    final Map<String, dynamic> json = jsonDecode(data) as Map<String, dynamic>;
    return NotificationPayloadModel.fromJson(json);
  }

  String toStringify() {
    return jsonEncode(toJson());
  }

  factory NotificationPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationPayloadModelToJson(this);

  @override
  List<Object?> get props => [actionType, params, playSound];
}
