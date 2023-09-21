import 'dart:convert';
import 'dart:developer';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import 'package:dio/browser.dart';
// ...

//http://101.53.133.120:8016/api/method/api.api.make_lead
//https://jsonplaceholder.typicode.com/todos/1

class Api {
  final String urlHead = 'https://wahni-mobapp.frappe.cloud/api/method/api';
  final String path = '.api.make_lead';
  // Dio dio = Dio();

  Future createlead(
      {required BuildContext context, required name, required mobile}) async {
    // http.httpClientAdapter = BrowserHttpClientAdapter();
    try {
      var url = Uri.parse('$urlHead${path}');
      Response response = await http
          .post(
            url,
            headers: {
              'Access-Control-Allow-Origin': '*',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({"first_name": "$name", "mobile_no": "$mobile"}),
          )
          .timeout(const Duration(seconds: 30));
      log('${response.body}');
      var result = jsonDecode(response.body);
      result = result['message'];
      if (result['success']) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
          child: Text('${result['message']}'),
        )));
      } else {}
      return result['success'];
      // } on DioException catch (e) {
      //   exeptionFunction(error: e, context: context);
    } catch (e) {
      log('$e');
    }
  }

  // exeptionFunction({required error, required context}) async {
  //   log('${error}');
  //   print(StackTrace.current.toString());
  //   if (error.type == DioExceptionType.connectionTimeout) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Container(
  //       child: Text('$error'),
  //     )));
  //   } else if (error.type == DioExceptionType.receiveTimeout) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Container(
  //       child: Text('$error'),
  //     )));
  //   } else if (error.type == DioExceptionType.badResponse) {
  //     if (error.response!.statusCode == 403) {
  //       // await LocalDb().logOutfromApp(context: context);
  //     } else if (error.response!.statusCode == 404) {
  //       Navigator.of(context).pop();
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Container(
  //         child: Text('$error'),
  //       )));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Container(
  //         child: Text('$error'),
  //       )));
  //     }
  //   } else {
  //     if (error.error.message == 'Connection failed') {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Container(
  //         child: Text('$error'),
  //       )));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Container(
  //         child: Text('$error'),
  //       )));
  //     }
  //   }
  // }
}
