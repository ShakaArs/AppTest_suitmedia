import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/datanasabah_controller.dart';

class DataNasabahView extends GetView<DataNasabahController> {
  const DataNasabahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Third Screen',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Obx(
        () {
          // Display the data using a ListView.builder
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              var user = controller.users[index];
              return ListTile(
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
