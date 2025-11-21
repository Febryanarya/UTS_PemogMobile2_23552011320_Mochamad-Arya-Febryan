import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartGridPage extends StatelessWidget {
  CartGridPage({super.key});

final List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: "Hino Ranger",
    price: 850000000,
    image: "assets/hino.png",
    truckType: "Trailer",
    capacityTon: 18,
    plateNumber: "B 9123 TR",
  ),
  ProductModel(
    id: 2,
    name: "Mitsubishi Fuso",
    price: 790000000,
    image: "assets/fuso.png",
    truckType: "Box",
    capacityTon: 8,
    plateNumber: "B 7721 ML",
  ),
  ProductModel(
    id: 3,
    name: "Isuzu Giga",
    price: 880000000,
    image: "assets/isuzu.png",
    truckType: "Dump",
    capacityTon: 12,
    plateNumber: "B 4432 DR",
  ),
];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          onAdd: () => context.read<CartCubit>().addToCart(product),
        );
      },
    );
  }
}
