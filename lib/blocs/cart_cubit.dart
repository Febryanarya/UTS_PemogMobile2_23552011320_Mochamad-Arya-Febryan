import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  /// Tambah Produk ke Keranjang
  void addToCart(ProductModel product) {
    final cart = List<CartItem>.from(state);

    final index = cart.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cart[index].quantity += 1;
    } else {
      cart.add(CartItem(product: product));
    }

    emit(cart);
  }

  /// Hapus Produk dari Keranjang
  void removeFromCart(ProductModel product) {
    final cart = List<CartItem>.from(state);
    cart.removeWhere((item) => item.product.id == product.id);
    emit(cart);
  }

  /// Update jumlah item
  void updateQuantity(ProductModel product, int value) {
    final cart = List<CartItem>.from(state);

    final index = cart.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cart[index].quantity = value;
      if (cart[index].quantity <= 0) {
        cart.removeAt(index);
      }
    }

    emit(cart);
  }

  /// Mendapat total jumlah semua item dalam keranjang
  int getTotalItems() {
    return state.fold(0, (sum, item) => sum + item.quantity);
  }

  /// BONUS — Total harga keseluruhan (qty * harga)
  int getTotalPrice() {
    return state.fold(0, (sum, item) => sum + (item.quantity * item.product.price));
  }
}
