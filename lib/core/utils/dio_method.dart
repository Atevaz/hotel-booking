import 'package:booking_hotel/core/constants/error_messages.dart';
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

    if (r.data['status']['type'] == '0' && r.data['data'] == null) {
      throw ServerException(
        arMessage: '${r.data['status']['title']?['ar']}',
        enMessage: '${r.data['status']['title']?['en']}',
      );
    }

    return r.data;
  } on DioError catch (e) {
    debugPrint("Error_Message => ${e.message}");
    debugPrint("Error_Error => ${e.error.toString()}");
    debugPrint("Error_Type => ${e.type.toString()}");

    throw const ServerException(
      enMessage: Server_Request_En_Error,
      arMessage: Server_Request_Ar_Error,
    );
  } catch (e) {
    ServerException exception = e as ServerException;

    throw ServerException(
      enMessage: exception.enMessage,
      arMessage: exception.arMessage,
    );
  }
}
