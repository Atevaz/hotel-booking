import 'package:booking_hotel/core/exceptions/server_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future serverRequest({
  required Future<Response> Function() call,
}) async {
  try {
    final r = await call.call();
    debugPrint("Response_Data => ${r.data}");
    debugPrint("Response_Code => ${r.statusCode}");

    if (r.data['status']['type'] == '0') {
      dynamic title = r.data['status']['title'];

      throw ServerException(
        message: title is String ? title : r.data['status']['title']['en'],
        code: r.statusCode ?? 500,
        error: r.data['status']['title']['ar'],
      );
    }

    return r.data;
  } on DioError catch (e) {
    debugPrint("Error_Message => ${e.message}");
    debugPrint("Error_Error => ${e.error.toString()}");
    debugPrint("Error_Type => ${e.type.toString()}");

    throw const ServerException(
      code: 100,
      message: "Server Request Failed!",
      error: 'Server Error',
    );
  } catch (e) {
    ServerException exception = e as ServerException;

    throw ServerException(
      code: exception.code,
      message: exception.message,
      error: e.error,
    );
  }
}
