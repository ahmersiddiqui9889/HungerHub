import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerhub/backends/food_model.dart';
import 'package:hungerhub/backends/food_repository.dart';
import 'package:hungerhub/utils.dart';
import 'package:image_picker/image_picker.dart';

class CreateFood extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<CreateFood> {
  var _myFormKey = GlobalKey<FormState>();
  var foodName = TextEditingController();
  var productionDate = TextEditingController();
  var expiryDate = TextEditingController();
  var quantity = TextEditingController();
  final foodRepo = Get.put(FoodRepository());


  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }


  Future<void> createFood(FoodModel food) async {
    print("in create food");
    await foodRepo.createFood(food);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Food", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5.0),
        body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Form(
        key: _myFormKey,
        child: Column(
            children: <Widget>[
              // Add Photo
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Stack(
                  children: [

                    _image != null
                      ? CircleAvatar(
                        radius: 80,
                        backgroundImage: MemoryImage(_image!),
                      )
                    
                      : CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/food.png')
                      ),
                      Positioned(
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(Icons.add_a_photo),
                        ),
                        bottom: -10,
                        left: 120
                      )
                  ]
                )
              ),

              // Food Name
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                controller: foodName,
                validator: (String? name) {
                  if(name == null || name.isEmpty) {
                    return "Please Enter Food Name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Food Name",
                  hintText: "Enter food name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              )
            ),

              // Production Date
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                controller: productionDate,
                keyboardType: TextInputType.phone,
                validator: (String? date) {
                  if(date == null || date.isEmpty) {
                    return "Please Enter Production Date";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Production Date",
                  hintText: "DD-MM-YYYY",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              )
            ),


              // Expiry Date
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                controller: expiryDate,
                keyboardType: TextInputType.phone,
                validator: (String? date) {
                  if(date == null || date.isEmpty) {
                    return "Please Enter Expiry Date";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Date of Expiry",
                  hintText: "YYYY-MM-DD",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              )
            ),


              // Quantity
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                controller: quantity,
                keyboardType: TextInputType.number,
                validator: (String? weight) {
                  if(weight == null || weight.isEmpty) {
                    return "Please Enter Food Weight";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Quantity",
                  hintText: "in Kgs",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              )
            ),
          ],
        )
      )
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
      // Add your action here
      if(_myFormKey.currentState!.validate()){
      FoodModel food = FoodModel(
        foodName: foodName.text.trim(),
        produced: productionDate.text.trim(),
        expiry: expiryDate.text.trim(),
        quantity: quantity.text.trim(),
      );

      createFood(food);

      setState(() {
        foodName.clear();
        productionDate.clear();
        expiryDate.clear();
        quantity.clear();
      }
    );}

    },
    child: const Icon(Icons.done_outlined),
    )
    );
  }
}