import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/models/shoe.dart';

class WishlistNotifier extends StateNotifier<List<Shoe>> {
  WishlistNotifier() : super([]);
  bool toogleWishlist(Shoe shoe) {
    if (state.contains(shoe)) {
      state = state.where((el) => el.id != shoe.id).toList();
      return false;
    } else {
      state = [...state, shoe];
      return true;
    }
  }

  bool isInWishlist(Shoe shoe) {
    if (state.contains(shoe)) {
      return true;
    } else {
      return false;
    }
  }
}

final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<Shoe>>(
  (ref) => WishlistNotifier(),
);
