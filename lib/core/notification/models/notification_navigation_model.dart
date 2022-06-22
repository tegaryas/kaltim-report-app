import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_navigation_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NotificationNavigationModel extends Equatable {
  final String screenPath;
  final Map<String, dynamic>? screenArgs;

  const NotificationNavigationModel(
      {required this.screenPath, required this.screenArgs});

  factory NotificationNavigationModel.fromString(String data) {
    final Map<String, dynamic> json = jsonDecode(data) as Map<String, dynamic>;
    return NotificationNavigationModel.fromJson(json);
  }

  factory NotificationNavigationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationNavigationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationNavigationModelToJson(this);

  @override
  List<Object?> get props => [screenPath, screenArgs];
}
