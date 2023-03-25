import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginasterayCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? time = '12:14',
    String? ip = '',
    String? os = 'Win 11',
    String? location = '22.572672 88.363882',
  }) {
    final body = '''
{
  "username": "${username}",
  "password": "${password}",
  "time": "12:14",
  "ip": "",
  "os": "Win 11",
  "device": "Dell",
  "location": "22.572672 88.363882",
  "timezone": "Asia/Kolkata",
  "language": "Hindi",
  "browser": "chrome"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Loginasteray',
      apiUrl: 'https://100014.pythonanywhere.com/api/mobilelogin/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic userinfo(dynamic response) => getJsonField(
        response,
        r'''$.userinfo''',
      );
  static dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.role''',
      );
  static dynamic username(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.username''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.email''',
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.phone''',
      );
  static dynamic usertype(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.User_type''',
      );
  static dynamic language(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.language''',
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.city''',
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.country''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.status''',
      );
  static dynamic dowelltime(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.dowell_time''',
      );
  static dynamic timezone(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.timezone''',
      );
  static dynamic regionaltime(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.regional_time''',
      );
  static dynamic servertime(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.server_time''',
      );
  static dynamic browser(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.browser''',
      );
  static dynamic userOS(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.userOS''',
      );
  static dynamic userDevice(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.userDevice''',
      );
  static dynamic userID(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.userID''',
      );
  static dynamic logineventID(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.login_eventID''',
      );
  static dynamic clientadminid(dynamic response) => getJsonField(
        response,
        r'''$.userinfo.client_admin_id''',
      );
}

class ProductslistCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'productslist',
      apiUrl: 'https://100096.pythonanywhere.com/product_list/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? time = '',
    String? location = '',
    String? os = '',
  }) {
    final body = '''
{
  "username": "${username}",
  "password": "${password}",
  "time": "${time}",
  "ip": "null",
  "os": "${os}",
  "device": "Phone",
  "location": "${location}",
  "timezone": "null",
  "language": "null",
  "browser": "null"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://100014.pythonanywhere.com/api/mobilelogin/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RoomlistCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'roomlist',
      apiUrl: 'https://100096.pythonanywhere.com/room_list/login',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic roomname(dynamic response) => getJsonField(
        response,
        r'''$.rooms[:].room_name''',
        true,
      );
  static dynamic productname(dynamic response) => getJsonField(
        response,
        r'''$.rooms[:].company''',
        true,
      );
  static dynamic roomlist(dynamic response) => getJsonField(
        response,
        r'''$.rooms[:]''',
        true,
      );
}

class ChatroomCall {
  static Future<ApiCallResponse> call({
    int? roomid = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'chatroom',
      apiUrl: 'https://100096.pythonanywhere.com/send/${roomid}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '': roomid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allmessages(dynamic response) => getJsonField(
        response,
        r'''$.messages[:]''',
        true,
      );
}

class ProductwiseroomlistCall {
  static Future<ApiCallResponse> call({
    String? productName = 'workflowai',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'productwiseroomlist',
      apiUrl: 'https://100096.pythonanywhere.com/room_list/${productName}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allrooms(dynamic response) => getJsonField(
        response,
        r'''$.rooms[:]''',
        true,
      );
}

class WorkflowairoomlistCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'workflowairoomlist',
      apiUrl: 'https://100096.pythonanywhere.com/room_list/workfloai',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetMessageCall {
  static Future<ApiCallResponse> call({
    int? roomId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMessage',
      apiUrl: 'https://100096.pythonanywhere.com/send/${roomId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.messages[:].message''',
        true,
      );
  static dynamic messageid(dynamic response) => getJsonField(
        response,
        r'''$.messages[:].id''',
        true,
      );
}

class SendMessageCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
    String? message = '',
    int? roomId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'sendMessage',
      apiUrl: 'https://100096.pythonanywhere.com/send/${roomId}/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'session_id': sessionId,
        'message': message,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
