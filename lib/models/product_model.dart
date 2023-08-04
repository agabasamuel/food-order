import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      description: snap['description'],
    );
    return product;
  }

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
      category: 'Car headlight',
      imageUrl:
          'https://images.unsplash.com/photo-1516610540415-d1b25463c7f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2FyJTIwaGVhZGxpZ2h0cyUyMGJtd3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 100000,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '2',
      name: 'Prius',
      category: 'Car headlight',
      imageUrl:
          'https://media.istockphoto.com/id/157589272/photo/headlight-of-a-new-car-on.webp?b=1&s=170667a&w=0&k=20&c=NeJfllHQSsoBbAtfQPERiwkUf2G4yQKQpQRkxv5P2ag=',
      price: 200000,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '3',
      name: 'Tesla',
      category: 'Car headlights',
      imageUrl:
          'https://images.unsplash.com/photo-1515569067071-ec3b51335dd0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyJTIwaGVhZGxpZ2h0cyUyMHRveW90YXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 100000,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '4',
      name: 'toyota',
      category: 'Car headlight',
      imageUrl:
          'https://images.unsplash.com/photo-1622214587562-64704ac3bee0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2FyJTIwaGVhZGxpZ2h0cyUyMHRveW90YXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60',
      price: 299000,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '5',
      name: 'Audi',
      category: 'Car headlights',
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
      category: 'Car headlight',
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
    Product(
      id: '15',
      name: 'ferari',
      category: 'Car spoiler',
      imageUrl:
          'data:image/jpeg;base64,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',
      price: 59900,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '16',
      name: 'porche',
      category: 'Car spoiler',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcFYI6WZDGw5hGR9VbBMr9RVnrM7bi5GT8Jw&usqp=CAU',
      price: 5900,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '17',
      name: 'subaru',
      category: 'Car spoiler',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiiWYzC57leTFgloYPXClIPdNtSOOyfk6Msg&usqp=CAU',
      price: 6900,
      isRecommended: true,
      isPopular: false,
    ),
  ];

  // static fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
