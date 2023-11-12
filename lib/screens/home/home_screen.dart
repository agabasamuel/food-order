import 'package:car_spare/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
// import '../../widgets/custom_appbar.dart';
// import '../../widgets/custom_navbar.dart';
// import '../../widgets/hero_carousel_card.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/widgets.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'FoodOrder'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: true,
                  initialPage: 2,
                  // autoPlay: true,
                ),
                items: Category.categories
                    .map((category) => HeroCarouselCard(category: category))
                    .toList(),
              ),
            ),

            SectionTitle(title: 'RECOMMENDED'),
            //Product Card
            // ProductCard(
            //   product: Product.products[0],
            // )
            ProductCarousel(
                products: Product.products
                    .where((product) => product.isRecommended)
                    .toList()),

            SectionTitle(title: 'POPULAR'),
            //Product Card
            // ProductCard(
            //   product: Product.products[0],
            // )
            ProductCarousel(
                products: Product.products
                    .where((product) => product.isPopular)
                    .toList()),
          ],
        ),
      ),
    );
  }
}
