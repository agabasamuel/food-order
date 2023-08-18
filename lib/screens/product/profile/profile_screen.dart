import 'package:car_spare/models/product_model.dart';
import 'package:car_spare/utils.dart';
import 'package:car_spare/widgets/custom_appbar.dart';
import 'package:car_spare/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';
import 'package:car_spare/utils.dart';

// import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  // const ProfileScreen({super.key});

  final nameController = TextEditingController();

  final imageController = TextEditingController();

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'profile'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(
                hintText: 'image URL',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CollectionReference collRef =
                    FirebaseFirestore.instance.collection('client');
                collRef.add(
                  {
                    'name': nameController.text,
                    'image': imageController.text,
                  },
                );
                nameController.clear();

                imageController.clear();
              },
              child: const Text('Add client'),
            ),
            // Stack(
            //   children: [
            // CircleAvatar(
            //   radius: 65,
            //   backgroundImage:
            // NetworkImage(
            //     'data:image/png;base64,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'
            //     ),
            // ),
            // Positioned(
            //   child: IconButton(
            //     icon: const Icon(Icons.add_a_photo),
            //     onPressed: () {},
            //   ),
            //   bottom: -10,
            //   left: 80,
            // )
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('client').snapshots(),
                builder: (context, snapshot) {
                  List<Row> clientWidgets = [];
                  if (snapshot.hasData) {
                    final clients = snapshot.data?.docs.reversed.toList();
                    for (var client in clients!) {
                      final clientWidget = Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(client['name']),
                            CachedNetworkImage(
                              imageUrl: client['image'],
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              height: 50, // Customize the image height
                              width: 50, // Customize the image width
                            ),
                          ]);
                      clientWidgets.add(clientWidget);
                    }
                  }
                  return Expanded(
                    child: ListView(
                      children: clientWidgets,
                    ),
                  );
                }),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
