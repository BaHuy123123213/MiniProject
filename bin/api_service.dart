import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'user_model.dart';

class ApiService {
  Future<User?> fetchRandomUser() async{
    print("Đang gọi Api , chờ chút nha ...");
    final stopwatch = Stopwatch();
    stopwatch.start();
    final response =  await http.get(Uri.parse('https://randomuser.me/api/'));
    stopwatch.stop();
    print("Api xử lý tốn ${stopwatch.elapsed.inSeconds} giây ");

    if(response.statusCode == 200){
      Map<String , dynamic> data = json.decode(response.body);
      var userData = data['results'] [0];

      //tạo đối tượng data từ json 

      User user = User.fromJson(userData);
      return user ;
    }else{
      print("Failed to load user data. Status code : ${response.statusCode}");
      return null;
    }
    }
  }