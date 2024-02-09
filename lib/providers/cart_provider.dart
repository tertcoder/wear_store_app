import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/models/shoe.dart';

class CartNotifier extends StateNotifier<List<Shoe>> {
  CartNotifier() : super([]);

  bool toogleInCart(Shoe shoe) {
    if (state.contains(shoe)) {
      state = state.where((el) => el.id != shoe.id).toList();
      return false;
    } else {
      state = [...state, shoe];
      return true;
    }
  }

  bool isInCart(Shoe shoe) {
    if (state.contains(shoe)) {
      return true;
    } else {
      return false;
    }
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Shoe>>(
  (ref) => CartNotifier(),
);
