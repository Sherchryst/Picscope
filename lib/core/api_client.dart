import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picscope/core/api_key.dart';
import 'package:picscope/shared/styles.dart';

ApiClient apiClient = ApiClient(accessKey);

class ApiClient {
  final Dio _dio = Dio();
  static const String _baseUrl = "https://api.unsplash.com/";
  final String _accessKey;

  ApiClient(this._accessKey) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _logAndAddAccessKey,
        onResponse: _logResponse,
      ),
    );
  }

  // Logs the request and adds access key to query parameters
  void _logAndAddAccessKey(
      RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["client_id"] = _accessKey;
    print("Request: ${options.method} ${options.path}");
    print("Headers: ${options.headers}");
    print("Params: ${options.queryParameters}");
    handler.next(options);
  }

  // Logs the response status and data
  void _logResponse(Response response, ResponseInterceptorHandler handler) {
    print("Response: ${response.statusCode}");
    print("Data: ${response.data}");
    handler.next(response);
  }

  // Search for photos
  Future<Response> searchPhotos({
    required String query,
    int page = 1,
    int perPage = 1,
  }) async {
    return await _makeRequest(
      "${_baseUrl}search/photos",
      queryParameters: {
        "query": query,
        "page": page,
        "per_page": perPage,
      },
    );
  }

  // Download a photo
  Future<Response> downloadPhoto({required String url}) async {
    return await _makeRequest(url, queryParameters: {});
  }

  // Makes a request using Dio
  Future<Response> _makeRequest(String path,
      {required Map<String, dynamic> queryParameters}) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: "application/json",
          },
        ),
      );
      return response;
    } on DioError catch (error) {
      return error.response ??
          Response(statusCode: 500, requestOptions: error.requestOptions);
    }
  }

  void displayMessage(BuildContext context, String? text, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text!, style: styles.textBody(context)),
      backgroundColor: isError ? Colors.red.shade300 : Colors.green.shade300,
    ));
  }
}
