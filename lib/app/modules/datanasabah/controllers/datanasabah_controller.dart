import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/api.dart';

class DataNasabahController extends GetxController {
  RxList users = [].obs;

  Future<void> getDataNasabah() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(API.data_nasabah);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        users.assignAll(List<Map<String, dynamic>>.from(data));
        print(data);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getDataNasabah();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getDataNasabah();
    update();
  }
}
