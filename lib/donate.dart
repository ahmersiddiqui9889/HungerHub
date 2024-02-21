import 'package:flutter/material.dart';
import 'registrationpage.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HUNGERHUB', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 5.0
    ),


    body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
          width: 300,
          height: 250,
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('-: Make a Difference with a Click :-', style: TextStyle(fontSize: 16.0, color: Colors.blueAccent,)),
                const SizedBox(height: 15),
                const Text('Donate Now!', style: TextStyle(fontSize: 20.0, color: Colors.blueAccent,)),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationPage()),
                    );
                  },
                child: const Text('DONATE', style: TextStyle(color: Colors.blue, fontSize: 16.0),),
              ),
              const SizedBox(height: 10),
              const Text("Your small act of kindness \ncan make a big difference.", style: TextStyle(fontSize:14, color: Colors.blueGrey)),
              ]
            ),

          )
        ),
        const SizedBox(height: 120),
        const Text("Did you know?", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Text("\nAccording to the World Food Programme, approximately 690 million people worldwide suffer from hunger, with the majority living in developing countries. Your donation can help provide essential meals to those in need and make a difference in the fight against hunger and poverty.", textAlign: TextAlign.center)
        )
        ]
        )
      ),
    );
  }
}