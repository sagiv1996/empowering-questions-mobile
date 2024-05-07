// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      $enumDecode(_$GenderOptionsEnumMap, json['gender']),
      (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryOptionsEnumMap, e))
          .toList(),
      id: json['_id'] as String,
      frequency: $enumDecode(_$FrequencyOptionsEnumMap, json['frequency']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'frequency': _$FrequencyOptionsEnumMap[instance.frequency]!,
      'gender': _$GenderOptionsEnumMap[instance.gender]!,
      'categories':
          instance.categories.map((e) => _$CategoryOptionsEnumMap[e]!).toList(),
    };

const _$GenderOptionsEnumMap = {
  GenderOptions.male: 'male',
  GenderOptions.female: 'female',
};

const _$CategoryOptionsEnumMap = {
  CategoryOptions.selfConfidence: 'self confidence',
  CategoryOptions.relationship: 'relationship',
  CategoryOptions.positiveFeelings: 'positive feelings',
  CategoryOptions.communication: 'communication',
  CategoryOptions.spiritualQuestions: 'spiritual Questions',
  CategoryOptions.career: 'career',
  CategoryOptions.familyLife: 'family life',
  CategoryOptions.universityStudies: 'university studies',
};

const _$FrequencyOptionsEnumMap = {
  FrequencyOptions.little: 'little',
  FrequencyOptions.normal: 'normal',
  FrequencyOptions.extra: 'extra',
};

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestUser implements RestUser {
  _RestUser(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= '/user';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> createUser(Map<String, dynamic> map) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> updateUser(Map<String, dynamic> map) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> getUser() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = User.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
