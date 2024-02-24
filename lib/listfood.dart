import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListFood extends StatelessWidget {
  const ListFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Items", style: TextStyle(fontSize: 24, color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('foods').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final foods = snapshot.data?.docs.toList();
            return ListView.builder(
              itemCount: foods?.length,
              itemBuilder: (context, index) {
                final food = foods?[index];
                Widget leadingWidget;
                if(food?['imageUrl'] != '') {
                  print("Inside image loading");
                  leadingWidget = CircleAvatar(
                    backgroundImage: NetworkImage(food?['imageUrl']),
                    radius: 30,
                  );
                } else {
                  leadingWidget = const Icon(Icons.fastfood_outlined);
                }
                return Card(
                  child: ListTile(
                    leading: leadingWidget,
                    title: Text(food?['foodName']),
                    subtitle: Text('Produced: ${food?['produced']}\nExpiry: ${food?['expiry']}\nQuantity: ${food?['quantity']}'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}