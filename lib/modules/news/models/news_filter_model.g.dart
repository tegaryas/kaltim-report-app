// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_filter_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NewsFilterModelCWProxy {
  NewsFilterModel apiKey(String apiKey);

  NewsFilterModel category(NewsCategory? category);

  NewsFilterModel country(String country);

  NewsFilterModel page(int page);

  NewsFilterModel pageSize(int pageSize);

  NewsFilterModel q(String? q);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewsFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewsFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  NewsFilterModel call({
    String? apiKey,
    NewsCategory? category,
    String? country,
    int? page,
    int? pageSize,
    String? q,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNewsFilterModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNewsFilterModel.copyWith.fieldName(...)`
class _$NewsFilterModelCWProxyImpl implements _$NewsFilterModelCWProxy {
  final NewsFilterModel _value;

  const _$NewsFilterModelCWProxyImpl(this._value);

  @override
  NewsFilterModel apiKey(String apiKey) => this(apiKey: apiKey);

  @override
  NewsFilterModel category(NewsCategory? category) => this(category: category);

  @override
  NewsFilterModel country(String country) => this(country: country);

  @override
  NewsFilterModel page(int page) => this(page: page);

  @override
  NewsFilterModel pageSize(int pageSize) => this(pageSize: pageSize);

  @override
  NewsFilterModel q(String? q) => this(q: q);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewsFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewsFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  NewsFilterModel call({
    Object? apiKey = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? pageSize = const $CopyWithPlaceholder(),
    Object? q = const $CopyWithPlaceholder(),
  }) {
    return NewsFilterModel(
      apiKey: apiKey == const $CopyWithPlaceholder() || apiKey == null
          ? _value.apiKey
          // ignore: cast_nullable_to_non_nullable
          : apiKey as String,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as NewsCategory?,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
      page: page == const $CopyWithPlaceholder() || page == null
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      pageSize: pageSize == const $CopyWithPlaceholder() || pageSize == null
          ? _value.pageSize
          // ignore: cast_nullable_to_non_nullable
          : pageSize as int,
      q: q == const $CopyWithPlaceholder()
          ? _value.q
          // ignore: cast_nullable_to_non_nullable
          : q as String?,
    );
  }
}

extension $NewsFilterModelCopyWith on NewsFilterModel {
  /// Returns a callable class that can be used as follows: `instanceOfclass NewsFilterModel extends Equatable.name.copyWith(...)` or like so:`instanceOfclass NewsFilterModel extends Equatable.name.copyWith.fieldName(...)`.
  _$NewsFilterModelCWProxy get copyWith => _$NewsFilterModelCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `NewsFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewsFilterModel(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  NewsFilterModel copyWithNull({
    bool category = false,
    bool q = false,
  }) {
    return NewsFilterModel(
      apiKey: apiKey,
      category: category == true ? null : this.category,
      country: country,
      page: page,
      pageSize: pageSize,
      q: q == true ? null : this.q,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsFilterModel _$NewsFilterModelFromJson(Map<String, dynamic> json) =>
    NewsFilterModel(
      apiKey: json['apiKey'] as String,
      country: json['country'] as String,
      pageSize: json['pageSize'] as int,
      page: json['page'] as int,
      category: $enumDecodeNullable(_$NewsCategoryEnumMap, json['category']),
      q: json['q'] as String?,
    );

Map<String, dynamic> _$NewsFilterModelToJson(NewsFilterModel instance) {
  final val = <String, dynamic>{
    'apiKey': instance.apiKey,
    'country': instance.country,
    'pageSize': instance.pageSize,
    'page': instance.page,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', _$NewsCategoryEnumMap[instance.category]);
  writeNotNull('q', instance.q);
  return val;
}

const _$NewsCategoryEnumMap = {
  NewsCategory.business: 'business',
  NewsCategory.technology: 'technology',
  NewsCategory.health: 'health',
  NewsCategory.sports: 'sports',
  NewsCategory.unknwon: 'unknwon',
};
