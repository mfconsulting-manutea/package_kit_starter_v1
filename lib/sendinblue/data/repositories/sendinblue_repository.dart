import 'dart:io';

import 'package:dio/dio.dart';

class SendinblueRepository {
  final String apiKey;

  SendinblueRepository({
    required this.apiKey,
  });

  Future sendTransactionalEmail({required Map<String, dynamic> data}) async {
    Response response = await Dio().post(
      "https://api.sendinblue.com/v3/smtp/email",
      data: data,
      options: Options(
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "api-key": apiKey,
        },
      ),
    );

    return response.data;
  }
}
