// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../blocs/blocs.dart';
// import '/models/model.dart';
// import '/widgets/widgets.dart';

// class CatalogScreen extends StatelessWidget {
//   static const String routeName = '/catalog';

//   static Route route({required Category category}) {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (context) => CatalogScreen(category: category),
//     );
//   }

//   final Category category;

//   const CatalogScreen({
//     required this.category,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: category.name),
//       bottomNavigationBar: CustomNavBar(screen: routeName),
//       body: BlocBuilder<ProductBloc, ProductState>(
//         builder: (context, state) {
//           if (state is ProductLoading) {
//             return Center(
//               child: CircularProgressIndicator(color: Colors.black),
//             );
//           }
//           if (state is ProductLoaded) {
//             final List<Product> categoryProducts = state.products
//                 .where((product) => product.category == category.name)
//                 .toList();

//             return GridView.builder(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 8.0,
//                 vertical: 16.0,
//               ),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1.15,
//               ),
//               itemCount: categoryProducts.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Center(
//                   child: ProductCard.catalog(
//                     product: categoryProducts[index],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Text('Something went wrong');
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:car_spare/models/product_model.dart';
import 'package:car_spare/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

// import 'package:car_spare/models/category_model.dart';

class CatalogScreen extends StatelessWidget {
  // const CatalogScreen({super.key});

  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 16.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            // child: ProductCard(
            //   product: categoryProducts[index],
            //   widthFactor: 2.2,
            // ),
            child: ProductCard.catalog(
              product: categoryProducts[index],
            ),
          );
        },
      ),
    );
  }
}
