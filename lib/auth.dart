// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class AuthService {
  //Create User
  Future<bool> createUser(String displayName, String email, String number,
      String password, BuildContext context, String defaultCountry, String carrierCode) async {
    try {
      List<String?> words = displayName.split(" ");
      Map body = {
        'first_name': words[0],
        'last_name': words.length ==1? " ": words[1],
        'email': email,
        'formattedPhone': number?? '',
        'password': password,
        'type': 'user',
        'carrierCode': carrierCode?? '',
        'defaultCountry': defaultCountry?? '',
      };
      final response = await http.post(
        Uri.parse('$baseUrl/registration'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Headers.context: contextResult['contextId'],
        },
        body: json.encode(body),
      );

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);

        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.body),
          duration: const Duration(seconds: 6),
        ));
        return false;
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 6),
      ));
      return false;
    }
  }

// Login to app
  Future<bool> login(
      String password, String email, BuildContext context) async {
    try {
      Map body = {
        'email': email,
        'password': password,
      };
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: json.encode(body),
      );

      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data['message']);
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.body),
          duration: const Duration(seconds: 6),
        ));
        return false;
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 6),
      ));
      return false;
    }
  }
}
