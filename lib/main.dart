// // ignore_for_file: unused_import

// // import 'package:car_spare/screens/home/home_screen.dart';

// import 'package:car_spare/screens/home/home_screen.dart';
// import 'package:car_spare/widgets/custom_appbar.dart';
// import 'package:car_spare/widgets/custom_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'config/app_router.dart';
// import 'config/theme.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers:[
//         BlocProvider(create: (_) => WishListBloc()..add(StartWishList())),
//       ]
//       create: (context) => SubjectBloc(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'carSpare',
//         theme: theme(),
//         onGenerateRoute: AppRouter.onGenerateRoute,
//         initialRoute: HomeScreen.routeName,
//         // home: const HomeScreen(),
//       ),
//     );
//   }
// }

//Code base 1 end

import 'package:car_spare/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/config/theme.dart';
import '/config/app_router.dart';
import '/blocs/blocs.dart';
import '/repositories/repositories.dart';
import '/screens/screens.dart';
import '/simple_bloc_observer.dart';
import '/models/model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await Firebase.initializeApp();
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductAdapter());
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarSpare',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>(),
              ),
            ),
            BlocProvider(
              create: (_) => CartBloc()..add(LoadCart()),
            ),
            BlocProvider(
              create: (_) => PaymentBloc()..add(LoadPaymentMethod()),
            ),
            BlocProvider(
              create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                paymentBloc: context.read<PaymentBloc>(),
                checkoutRepository: CheckoutRepository(),
              ),
            ),
            BlocProvider(
              create: (_) => WishlistBloc(
                localStorageRepository: LocalStorageRepository(),
              )..add(
                  StartWishlist(),
                ),
            ),
            BlocProvider(
              create: (_) => CategoryBloc(
                categoryRepository: CategoryRepository(),
              )..add(
                  LoadCategories(),
                ),
            ),
            BlocProvider(
              create: (_) => ProductBloc(
                productRepository: ProductRepository(),
              )..add(LoadProducts()),
            ),
          ],
          child: MaterialApp(
            title: 'CarSpare',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: HomeScreen.routeName,
            // initialRoute: SplashScreen.routeName,
          ),
        ),
      ),
    );
  }
}

// CODE BASE 2 END

//UPLOAD AND RETRIEVE IMAGE AND DATA FROM FIREBASE

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:cached_network_image/cached_network_image.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final nameController = TextEditingController();
//   // final emailController = TextEditingController();
//   // final mobileController = TextEditingController();
//   final imageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: ,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.red),
//       // home: const RootPage(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SandBox'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   hintText: 'Name',
//                 ),
//               ),
//               // TextFormField(
//               //   controller: mobileController,
//               //   decoration: const InputDecoration(
//               //     hintText: 'mobile',
//               //   ),
//               // ),
//               // TextFormField(
//               //   controller: emailController,
//               //   decoration: const InputDecoration(
//               //     hintText: 'email',
//               //   ),
//               // ),
//               TextFormField(
//                 controller: imageController,
//                 decoration: const InputDecoration(
//                   hintText: 'image',
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   CollectionReference collRef =
//                       FirebaseFirestore.instance.collection('client');
//                   collRef.add(
//                     {
//                       'name': nameController.text,
//                       // 'email': emailController.text,
//                       // 'mobile': mobileController.text,
//                       'image': imageController.text,
//                     },
//                   );
//                   nameController.clear();
//                   // emailController.clear();
//                   // mobileController.clear();
//                   imageController.clear();
//                 },
//                 child: const Text('Add client'),
//               ),
//               StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('client')
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     List<Row> clientWidgets = [];
//                     if (snapshot.hasData) {
//                       final clients = snapshot.data?.docs.reversed.toList();
//                       for (var client in clients!) {
//                         final clientWidget = Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(client['name']),
//                               // Text(client['email']),
//                               // Text(client['mobile']),
//                               CachedNetworkImage(
//                                 imageUrl: client['image'],
//                                 placeholder: (context, url) =>
//                                     CircularProgressIndicator(),
//                                 errorWidget: (context, url, error) =>
//                                     Icon(Icons.error),
//                                 height: 50, // Customize the image height
//                                 width: 50, // Customize the image width
//                               ),
//                             ]);
//                         clientWidgets.add(clientWidget);
//                       }
//                     }
//                     return Expanded(
//                       child: ListView(
//                         children: clientWidgets,
//                       ),
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//FINAL ROUND

// import 'package:flutter/material.dart';
// import 'home_page.dart';
// import 'profile_page.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.red),
//       home: const RootPage(),
//     );
//   }
// }

// class RootPage extends StatefulWidget {
//   const RootPage({super.key});

//   @override
//   State<RootPage> createState() => _RootPageState();
// }

// class _RootPageState extends State<RootPage> {
//   int currentPage = 0;
//   List<Widget> pages = const [
//     HomePage(),
//     ProfilePage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CarSpare'),
//       ),
//       body: pages[currentPage],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           debugPrint('floating action button pressed');
//         },
//         child: const Icon(Icons.add),
//       ),
//       bottomNavigationBar: NavigationBar(
//         destinations: const [
//           NavigationDestination(icon: Icon(Icons.home), label: 'home'),
//           NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
//         ],
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         selectedIndex: currentPage,
//       ),
//     );
//   }
// }
