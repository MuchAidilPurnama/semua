import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({Key? key}) : super(key: key);

  final CounterController CountR = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            'Count: ${CountR.count}',
            style: TextStyle(fontSize: CountR.count.toDouble()),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                if (CountR.count > 1) {
                  CountR.decrement();
                } else {
                  Get.snackbar(
                    'Error', 'Tidak Boleh Kurang Dari 1',
                    snackPosition: SnackPosition.TOP,
                    // backgroundColor: Colors.grey
                  );
                }
              },
              child: Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: () {
                if (CountR.count < 100) {
                  CountR.increment();
                } else {
                  Get.snackbar('Error', 'Tidak Boleh Lebih Dari 100',
                      snackPosition: SnackPosition.TOP);
                }
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}