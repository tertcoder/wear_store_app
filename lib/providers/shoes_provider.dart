import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/models/shoe.dart';

class ShoesNotifier extends StateNotifier<List<Shoe>> {
  ShoesNotifier()
      : super(
          [
            Shoe(
              brand: 'Nike',
              image: 'assets/images/shoes/image-1.webp',
              name: 'Shoes 01',
              price: 79.49,
            ),
            Shoe(
              brand: 'Nike',
              image: 'assets/images/shoes/image-2.webp',
              name: 'Shoes 02',
              price: 96,
            ),
            Shoe(
              brand: 'Nike',
              image: 'assets/images/shoes/image-3.webp',
              name: 'Shoes 03',
              price: 126.04,
            ),
            Shoe(
              brand: 'Nike',
              image: 'assets/images/shoes/image-4.webp',
              name: 'Shoes 04',
              price: 145.32,
            ),
            Shoe(
              brand: 'Nike',
              image: 'assets/images/shoes/image-5.webp',
              name: 'Shoes 05',
              price: 102.2,
            ),
            Shoe(
              brand: 'Other',
              image: 'assets/images/shoes/image-6.webp',
              name: 'Shoes 06',
              price: 79.9,
            ),
            Shoe(
              brand: 'Reebok',
              image: 'assets/images/shoes/image-7.webp',
              name: 'Shoes 07',
              price: 99.99,
            ),
            Shoe(
              brand: 'Reebok',
              image: 'assets/images/shoes/image-8.webp',
              name: 'Shoes 08',
              price: 95,
            ),
            Shoe(
              brand: 'Adidas',
              image: 'assets/images/shoes/image-9.webp',
              name: 'Shoes 09',
              price: 67.5,
            ),
            Shoe(
              brand: 'Adidas',
              image: 'assets/images/shoes/image-11.webp',
              name: 'Shoes 11',
              price: 85.64,
            ),
            Shoe(
              brand: 'Vans',
              image: 'assets/images/shoes/image-12.webp',
              name: 'Shoes 12',
              price: 90,
            ),
            Shoe(
              brand: 'Vans',
              image: 'assets/images/shoes/image-13.webp',
              name: 'Shoes 13',
              price: 94.99,
            ),
            Shoe(
              brand: 'Puma',
              image: 'assets/images/shoes/image-14.webp',
              name: 'Shoes 14',
              price: 70.5,
            ),
            Shoe(
              brand: 'Puma',
              image: 'assets/images/shoes/image-15.webp',
              name: 'Shoes 15',
              price: 65.8,
            ),
          ],
        );
  List<Shoe> get shuffledShoe {
    final newShoes = List.of(state);
    newShoes.shuffle();

    return newShoes;
  }
}

final shoesProvider = StateNotifierProvider<ShoesNotifier, List<Shoe>>(
  (ref) => ShoesNotifier(),
);
