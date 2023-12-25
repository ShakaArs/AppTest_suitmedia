// Updated DataNasabahController
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/datanasabah.dart';

class DataNasabahController extends GetxController {
  RxList<UserModel> users = RxList<UserModel>();

  Future<void> loadTransaksi() async {
    try {
      var url = Uri.parse('https://reqres.in/api/users?page=1&per_page=10');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var data = responseData['data'];

        if (data != null && data.isNotEmpty) {
          users.assignAll(List<UserModel>.from(data.map((user) => UserModel(
                firstName: user['first_name'],
                lastName: user['last_name'],
                email: user['email'],
                avatar: user['avatar'],
                id: user['id'],
              ))));
        } else {
          print('Data is empty or null');
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    loadTransaksi();
    super.onInit();
  }
}
