// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_list_filter_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReportListFilterModelCWProxy {
  ReportListFilterModel lastDocument(String lastDocument);

  ReportListFilterModel pageSize(int pageSize);

  ReportListFilterModel status(ReportStatusType? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReportListFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReportListFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ReportListFilterModel call({
    String? lastDocument,
    int? pageSize,
    ReportStatusType? status,
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
  ReportListFilterModel status(ReportStatusType? status) =>
      this(status: status);

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
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return ReportListFilterModel(
      lastDocument:
          lastDocument == const $CopyWithPlaceholder() || lastDocument == null
              ? _value.lastDocument
              // ignore: cast_nullable_to_non_nullable
              : lastDocument as String,
      pageSize: pageSize == const $CopyWithPlaceholder() || pageSize == null
          ? _value.pageSize
          // ignore: cast_nullable_to_non_nullable
          : pageSize as int,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ReportStatusType?,
    );
  }
}

extension $ReportListFilterModelCopyWith on ReportListFilterModel {
  /// Returns a callable class that can be used as follows: `instanceOfReportListFilterModel.copyWith(...)` or like so:`instanceOfReportListFilterModel.copyWith.fieldName(...)`.
  _$ReportListFilterModelCWProxy get copyWith =>
      _$ReportListFilterModelCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `ReportListFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReportListFilterModel(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  ReportListFilterModel copyWithNull({
    bool status = false,
  }) {
    return ReportListFilterModel(
      lastDocument: lastDocument,
      pageSize: pageSize,
      status: status == true ? null : this.status,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportListFilterModel _$ReportListFilterModelFromJson(
        Map<String, dynamic> json) =>
    ReportListFilterModel(
      lastDocument: json['last_document'] as String,
      pageSize: json['page_size'] as int,
      status: $enumDecodeNullable(_$ReportStatusTypeEnumMap, json['status']),
    );

Map<String, dynamic> _$ReportListFilterModelToJson(
    ReportListFilterModel instance) {
  final val = <String, dynamic>{
    'last_document': instance.lastDocument,
    'page_size': instance.pageSize,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$ReportStatusTypeEnumMap[instance.status]);
  return val;
}

const _$ReportStatusTypeEnumMap = {
  ReportStatusType.selesai: 'selesai',
  ReportStatusType.validasi: 'validasi',
  ReportStatusType.tindakLanjut: 'tindakLanjut',
  ReportStatusType.proses: 'proses',
  ReportStatusType.menunggu: 'menunggu',
  ReportStatusType.tidakValid: 'tidakValid',
};
