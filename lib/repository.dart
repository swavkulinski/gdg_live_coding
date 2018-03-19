import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class User {
  final int id;
  final String name;
  final String email;

  User.fromJson(Map json) : id = json['id'], name = json['name'], email = json['email'];
}

Future<List<User>> loadUsers() async{
  return await rootBundle.loadString('assets/data.json')
  .asStream()
  .map((data) => JSON.decode(data))
  .expand((userJson) => userJson)
  .map((userJson) => new User.fromJson(userJson))
  .toList();
}

Future<List<User>> loadUsersRemote() async {
  return new HttpClient()
  .getUrl(new Uri.http('jsonplaceholder.typicode.com', 'users'))
  .then((request)=> request.close())
  .then((response) => response.transform(UTF8.decoder))
  .then((data) => data.map((data) => JSON.decode(data))
    .expand((userJson) => userJson)
    .map((userJson) => new User.fromJson(userJson))
    .toList());
}