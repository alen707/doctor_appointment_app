import 'dart:convert';
import 'package:docter_appointment_app/View/home_screens/home_layout.dart';
import 'package:docter_appointment_app/View/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInApi {
  Future<Map<String,dynamic>?>signInApi(BuildContext context,email,password) async {



    final responce = await http.post(
      Uri.parse("https://dummyjson.com/auth/login"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
        "username": email,
        "password": password,
        }
      )
    );

    print("api reached");
    print("api reached");
    print("api reached");
    print("api reached");
     if (responce.statusCode == 200) {

      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeLayout(),
      )
      );

      print("signin");
      print("signin");
      print("signin");
      print("signin");

      return jsonDecode(responce.body);
    }

    return null;
  }

  }
