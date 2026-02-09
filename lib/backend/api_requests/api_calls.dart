import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class KakaoAddressSearchCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    String? restApiKey = 'ee04d47cfa32d73a4b0a2a0850ed1208',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'KakaoAddressSearch',
      apiUrl: 'https://dapi.kakao.com/v2/local/search/address.json',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'KakaoAK ${restApiKey}',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class KakaoKeywordSearchCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    String? restApiKey = 'ee04d47cfa32d73a4b0a2a0850ed1208',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'KakaoKeywordSearch',
      apiUrl: 'https://dapi.kakao.com/v2/local/search/keyword.json',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'KakaoAK ${restApiKey}',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? documents(dynamic response) => getJsonField(
        response,
        r'''$.documents''',
        true,
      ) as List?;
  static List<String>? placename(dynamic response) => (getJsonField(
        response,
        r'''$.documents[:].place_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? addressname(dynamic response) => (getJsonField(
        response,
        r'''$.documents[:].address_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? roadaddressname(dynamic response) => (getJsonField(
        response,
        r'''$.documents[:].road_address_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class KMFListCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'KMFList',
      apiUrl:
          'https://sheets.googleapis.com/v4/spreadsheets/1sxJTGEF05WcZfwRAar-OS6cShwhrQBW-zp6KyFkgMmg/values/KMF!A1:J1500?key=AIzaSyApwZpn6h3nI2SqyAOuX7l-1uP9oKzQAgc',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GooglemapCall {
  static Future<ApiCallResponse> call({
    String? searchQuery = '',
  }) async {
    final ffApiRequestBody = '''
{
  "textQuery": "${escapeStringForJson(searchQuery)},한국",
  "languageCode": "ko",
  "regionCode": "KR",
  "pageSize": 10
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'googlemap',
      apiUrl: 'https://places.googleapis.com/v1/places:searchText',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': 'AIzaSyCAY8XKYo-AA6wSXom_m_4KtdyhpNbzJik',
        'X-Goog-FieldMask':
            'places.displayName,places.location,places.shortFormattedAddress,places.formattedAddress,places.rating,places.userRatingCount,places.photos,places.nationalPhoneNumber,places.websiteUri,places.currentOpeningHours',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
