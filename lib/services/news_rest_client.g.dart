// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _NewsRestClient implements NewsRestClient {
  _NewsRestClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NewsResponse> getHeadlines(
    apiKey, {
    query,
    sources,
    country,
    category,
    sortBy,
    pageSize,
    page,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<NewsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://newsapi.org/v2/top-headlines?language=en&q=${query}&sources=${sources}&sortBy=${sortBy}&pageSize=${pageSize}&page=${page}&apiKey=${apiKey}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NewsResponse> getEverything(
    apiKey, {
    query,
    sources,
    fromDate,
    toDate,
    sortBy,
    pageSize,
    page,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<NewsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://newsapi.org/v2/everything?language=en&q=${query}&searchIn=title&sources=${sources}&from=${fromDate}&to=${toDate}&sortBy=${sortBy}&pageSize=${pageSize}&page=${page}&apiKey=${apiKey}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewsResponse.fromJson(_result.data!);
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
}
