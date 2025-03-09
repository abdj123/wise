import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class FlowiseAPICallCall {
  static Future<ApiCallResponse> call({
    String? question = '',
    String? sessionId = '',
    String? chatKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}",
  "overrideConfig": {
    "sessionId": "${sessionId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Flowise API Call',
      apiUrl:
          'https://dddaaannniii-ChatBackMysql.hf.space/api/v1/prediction/${chatKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
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

  static String? answer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$''',
      ));
  static String? answertext(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetChatHistoryCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
    String? chatKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getChatHistory',
      apiUrl:
          'https://dddaaannniii-ChatBackMysql.hf.space/api/v1/chatmessage/${chatKey}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer zIAEFPvD_Byk8_uKxQ01-P5Wn_otuuNM_vTXmBo1-gI',
      },
      params: {
        'sessionId': sessionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? myList(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
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
