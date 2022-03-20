import 'dart:io';

import 'package:dio/dio.dart';

abstract class RestApiServiceInterface {
  /// Handle HTTP GET Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Params(Optional).
  Future<Response> get(String pathUrl,
      {Map<String, String?>? headers, Map<String, dynamic>? body});

  /// Handle HTTP POST Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body IN (Optional).
  Future<Response> post(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters});

  /// Handle HTTP PUT Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> put(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters});

  /// Handle HTTP PUT Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> patch(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters});

  /// Handle HTTP DELETE Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> delete(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters});

  /// Add posibility to Upload files to Server using Rest API
  ///
  /// Example:
  ///```
  ///     FormData.fromMap({
  ///     "name": "wendux",
  ///     "age": 25,
  ///     "file": await MultipartFile.fromFile("./text.txt",filename: "upload.txt"),
  ///     "files": [
  ///       await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
  ///       await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
  ///     ]
  ///     });
  /// ```
  Future<Response> uploadFiles(String pathUrl,
      {Map<String, String?>? headers,
      FormData? body,
      Function(int, int)? onSendProgress});

  /// Return full url of uploaded file, used for third party uploader
  Future<String> uploadFile(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      required File file,
      Function(int progress, int length)? onSendProgress});
}
