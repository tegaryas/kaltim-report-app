// import 'package:dio/src/response.dart';
// import 'package:dio/src/form_data.dart';
// import 'package:injectable/injectable.dart';
// import 'dart:io';

// import 'package:kaltim_report/services/rest_api_service/rest_api_service_interface.dart';

// @LazySingleton(as: RestApiServiceInterface)
// class RestApiService implements RestApiServiceInterface {
//   @override
//   Future<Response> delete(String pathUrl,
//       {Map<String, String?>? headers,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? queryParameters}) {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> get(String pathUrl,
//       {Map<String, String?>? headers, Map<String, dynamic>? body}) {
//     // TODO: implement get
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> patch(String pathUrl,
//       {Map<String, String?>? headers,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? queryParameters}) {
//     // TODO: implement patch
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> post(String pathUrl,
//       {Map<String, String?>? headers,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? queryParameters}) {
//     // TODO: implement post
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> put(String pathUrl,
//       {Map<String, String?>? headers,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? queryParameters}) {
//     // TODO: implement put
//     throw UnimplementedError();
//   }

//   @override
//   Future<String> uploadFile(String pathUrl,
//       {Map<String, String?>? headers,
//       Map<String, dynamic>? body,
//       required File file,
//       Function(int progress, int length)? onSendProgress}) {
//     // TODO: implement uploadFile
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> uploadFiles(String pathUrl,
//       {Map<String, String?>? headers,
//       FormData? body,
//       Function(int p1, int p2)? onSendProgress}) {
//     // TODO: implement uploadFiles
//     throw UnimplementedError();
//   }

//   /// Proces request to get statusCode from Rest API Response
//   /// or else throw Error
//   Response _handleResponse(Response response) {
//     final int statusCode = response.statusCode!;
//     if (statusCode == 200 ||
//         statusCode == 304 ||
//         statusCode == 201 ||
//         statusCode == 202) {
//       return response;
//     } else if ((response.data["error_code"] as String?) != null) {
//       throw ApiErrorModel.fromJson(response.data as Map<String, dynamic>);
//     } else if (statusCode == 401) {
//       throw BackendErrors.unauthorized;
//     } else if (statusCode == 400) {
//       throw BackendErrors.badRequest.copyWith(
//         message: response.data["message"] as String?,
//       );
//     } else if (statusCode == 500) {
//       throw BackendErrors.internalServerError;
//     } else {
//       throw BackendErrors.unknown.copyWith(
//           statusCode: statusCode, message: response.data["message"] as String?);
//     }
//   }

//   /// Process output from Expected Expetion in Catch(e,s)
//   ApiErrorModel _handleError(DioError e) {
//     if (e.type == DioErrorType.connectTimeout ||
//         e.type == DioErrorType.receiveTimeout ||
//         e.type == DioErrorType.sendTimeout) {
//       return FrontendErrors.apiConnectionTimeout;
//     }
//     return BackendErrors.unknown
//         .copyWith(statusCode: e.response?.statusCode, message: e.message);
//   }
// }
