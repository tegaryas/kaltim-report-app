// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_list_filter_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReportListFilterModelCWProxy {
  ReportListFilterModel lastDocument(String lastDocument);

  ReportListFilterModel pageSize(int pageSize);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReportListFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReportListFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ReportListFilterModel call({
    String? lastDocument,
    int? pageSize,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReportListFilterModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReportListFilterModel.copyWith.fieldName(...)`
class _$ReportListFilterModelCWProxyImpl
    implements _$ReportListFilterModelCWProxy {
  final ReportListFilterModel _value;

  const _$ReportListFilterModelCWProxyImpl(this._value);

  @override
  ReportListFilterModel lastDocument(String lastDocument) =>
      this(lastDocument: lastDocument);

  @override
  ReportListFilterModel pageSize(int pageSize) => this(pageSize: pageSize);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReportListFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReportListFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ReportListFilterModel call({
    Object? lastDocument = const $CopyWithPlaceholder(),
    Object? pageSize = const $CopyWithPlaceholder(),
  }) {
    return ReportListFilterModel(
      lastDocument: lastDocument == const $CopyWithPlaceholder()
          ? _value.lastDocument
          // ignore: cast_nullable_to_non_nullable
          : lastDocument as String,
      pageSize: pageSize == const $CopyWithPlaceholder()
          ? _value.pageSize
          // ignore: cast_nullable_to_non_nullable
          : pageSize as int,
    );
  }
}

extension $ReportListFilterModelCopyWith on ReportListFilterModel {
  /// Returns a callable class that can be used as follows: `instanceOfclass ReportListFilterModel extends Equatable.name.copyWith(...)` or like so:`instanceOfclass ReportListFilterModel extends Equatable.name.copyWith.fieldName(...)`.
  _$ReportListFilterModelCWProxy get copyWith =>
      _$ReportListFilterModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportListFilterModel _$ReportListFilterModelFromJson(
        Map<String, dynamic> json) =>
    ReportListFilterModel(
      lastDocument: json['last_document'] as String,
      pageSize: json['page_size'] as int,
    );

Map<String, dynamic> _$ReportListFilterModelToJson(
        ReportListFilterModel instance) =>
    <String, dynamic>{
      'last_document': instance.lastDocument,
      'page_size': instance.pageSize,
    };
