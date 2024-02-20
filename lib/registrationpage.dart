import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<RegistrationPage> {
  var _myFormKey = GlobalKey<FormState>();
  var _mobileNo = TextEditingController();
  var _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registeration Form", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 5.0,
        ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: Form(
          key: _myFormKey,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                  validator: (String? msg) {
                    if(msg == null || msg.isEmpty) {
                      return "Please enter name";
                    }
                    if(msg.length < 3) {
                      return "Name is less than 3 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter your name",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  )
                ),
              ),

              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _mobileNo,
                    validator: (String? num) {
                      if(num == null || num.isEmpty) {
                        return "Number cannot be empty";
                      }
                      if(num.length != 10) {
                        return "Please enter valid mobile number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Mobile",
                      hintText: "Enter your mobile number",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    )
                  ),
                ),

                Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (String? num) {
                    if(num == null || num.isEmpty) {
                      return "Please Confirm your Mobile Number";
                    }
                    if(num != _mobileNo.value.text) {
                      return "Mobile numbers don't match";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Confirm Mobile",
                    hintText: "Confirm your mobile number",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  )
                ),
              ),


              Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _password,
                validator: (String? pwd) {
                  if(pwd == null || pwd.isEmpty) {
                    return "Please Enter your Password";
                  }
                  if(pwd.length < 6) {
                    return "Password Length is too small";
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Set Password",
                  hintText: "Enter your Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                )
              ),
            ),


            Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              validator: (String? pwd) {
                if(pwd == null || pwd.isEmpty) {
                  return "Please Confirm your Password";
                }
                if(pwd != _password.value.text) {
                  return "Passwords don't match";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Enter your Password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              )
            ),
          ),


              ],
            )
        )
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.done),
      onPressed: () {
        _myFormKey.currentState?.validate();
      }
      )
  );
  }
}