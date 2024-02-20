import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: Text("Pindah Ke Profil"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/counter');
                },
                child: Text("Pindah ke halaman Counter"),
                ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/biodata');
                },
                child: Text("Pindah ke halaman Biodata"),
                ),
             ElevatedButton(
                onPressed: () {
                  Get.toNamed('/cart');
                },
                child: Text("Pindah ke halaman Cart"),
                )
          ],
        ),
      ),
    );
  }
}
