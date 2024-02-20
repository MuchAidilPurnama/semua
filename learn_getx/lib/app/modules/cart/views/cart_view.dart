import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/cart_controller.dart';


class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nama'),
                      onChanged: (value) => 
                         cartController.nama.value = value,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                     InkWell(
                      onTap: () => cartController.selectDate(context),
                      child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Tanggal Lahir',
                            hintText: 'Pilih Tanggal',
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tanggal Lahir:'),
                              Obx(() => Text(cartController.selectedDate
                                  .value)),
                            ],
                          )),
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      items: ['Islam', 'Kristen', 'Hindu', 'Budha', 'Lainnya']
                          .map((agama) => DropdownMenuItem(
                              value: agama, child: Text(agama)))
                          .toList(),
                      onChanged: (Value) =>
                          cartController.agama.value = Value.toString(),
                      decoration: InputDecoration(labelText: 'Agama'),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Laki- Laki',
                              groupValue: cartController.jeniskelamin.value,
                              onChanged: (value) =>
                                  cartController.jeniskelamin.value = value!,
                            )),
                        Text('Laki-Laki'),
                        Obx(() => Radio(
                              value: 'Perempuan',
                              groupValue: cartController.jeniskelamin.value,
                              onChanged: (value) =>
                                  cartController.jeniskelamin.value = value!,
                            )),
                        Text('Perempuan')
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Alamat'),
                      onChanged: (value) =>
                          cartController.alamat.value = value,
                    ),
                    SizedBox(height: 16.0),
                    for (String hobi in cartController.getHobiist())
                      Obx(() => CheckboxListTile(
                            title: Text(hobi),
                            value: cartController.hobi.contains(hobi),
                            onChanged: (value) =>
                                cartController.toggleHobi(hobi),
                          )),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => cartController.submitFrom(),
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Obx(() {
                if (cartController.isFormSubmitted.value) {
                  return Text(
                    'Output : ${cartController.nama}, ${cartController.selectedDate}, ${cartController.agama}, ${cartController.jeniskelamin}, ${cartController.alamat}, ${cartController.hobi}',
                    style: TextStyle(fontSize: 16.0),
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
