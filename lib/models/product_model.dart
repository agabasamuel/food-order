import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

// part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;
  @HiveField(7)
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    this.description,
  });

  // static Product fromSnapshot(DocumentSnapshot snap) {
  //   Product product = Product(
  //     id: snap.id,
  //     name: snap['name'],
  //     category: snap['category'],
  //     imageUrl: snap['imageUrl'],
  //     price: snap['price'],
  //     isRecommended: snap['isRecommended'],
  //     isPopular: snap['isPopular'],
  //     description: snap['description'],
  //   );
  //   return product;
  // }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
        description,
      ];

  static List<Product> products = [
    Product(
      id: '1',
      name: 'BMW',
      category: 'Car HEADLIGHT',
      imageUrl:
          'https://images.unsplash.com/photo-1516610540415-d1b25463c7f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2FyJTIwaGVhZGxpZ2h0cyUyMGJtd3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 100000,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '2',
      name: 'Prius',
      category: 'Car headlights',
      imageUrl:
          'https://media.istockphoto.com/id/157589272/photo/headlight-of-a-new-car-on.webp?b=1&s=170667a&w=0&k=20&c=NeJfllHQSsoBbAtfQPERiwkUf2G4yQKQpQRkxv5P2ag=',
      price: 200000,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '3',
      name: 'Tesla',
      category: 'Car Headlights',
      imageUrl:
          'https://images.unsplash.com/photo-1515569067071-ec3b51335dd0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyJTIwaGVhZGxpZ2h0cyUyMHRveW90YXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 100000,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '4',
      name: 'toyota',
      category: 'Car Headlight',
      imageUrl:
          'https://images.unsplash.com/photo-1622214587562-64704ac3bee0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2FyJTIwaGVhZGxpZ2h0cyUyMHRveW90YXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 299000,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '5',
      name: 'Audi',
      category: 'Car Headlights',
      imageUrl:
          'https://images.unsplash.com/photo-1581328136701-d3b67a31af35?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2FyJTIwaGVhZGxpZ2h0cyUyMHRveW90YXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 100000,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      id: '6',
      name: 'Pirelli',
      category: 'Car tire',
      imageUrl:
          'https://images.unsplash.com/photo-1582258514015-1be36bef6e19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGlyZWxsaXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 500000,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '7',
      name: 'Pirelli f2',
      category: 'Car tire',
      imageUrl:
          'https://images.unsplash.com/photo-1568644310089-8fce475968a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBpcmVsbGl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=700&q=60',
      price: 1232000,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '8',
      name: 'Pirelli f1',
      category: 'Car Tire',
      imageUrl:
          'https://images.unsplash.com/photo-1642342178278-9f868ae919d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBpcmVsbGl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=700&q=60', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2990000,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '9',
      name: 'run flats',
      category: 'Pirelli',
      imageUrl:
          'https://images.unsplash.com/photo-1640135187151-c232342afedc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBpcmVsbGl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=700&q=60',
      price: 1000000,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '10',
      name: 'Subaru',
      category: 'Yokohama',
      imageUrl:
          'https://media.istockphoto.com/id/471007853/photo/eighteen-inch-rim.webp?b=1&s=170667a&w=0&k=20&c=ppVINH-JjqISXW8LeZRzUKvTDKek6es-vbRwzJcwgy8=',
      price: 2777887,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      id: '11',
      name: 'code lyoko',
      category: 'Yokohama tires',
      imageUrl:
          'https://images.unsplash.com/photo-1603811439018-877d48550849?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8eW9rb2hhbWElMjB0aXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=700&q=60',
      price: 299,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '12',
      name: 'halogen bulb',
      category: 'Car Headlight',
      imageUrl:
          'https://media.istockphoto.com/id/126187526/photo/halogen-car-headlight-bulb.webp?b=1&s=170667a&w=0&k=20&c=XzNvylHXAjvvz3jwKygNBU6bV4Wefg5DmNnuODWa5ew=',
      price: 99000,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '13',
      name: 'benz',
      category: 'Tail light',
      imageUrl:
          'https://images.unsplash.com/photo-1645534733992-6efacf90788e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y2FyJTIwYnVsYnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 29900,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '14',
      name: 'ford',
      category: 'tail light',
      imageUrl:
          'https://images.unsplash.com/photo-1645534703253-07f84afc28f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2FyJTIwYnVsYnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 29900,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}
