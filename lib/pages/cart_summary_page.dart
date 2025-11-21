import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItem>>(
      builder: (context, cart) {
        final total = context.read<CartCubit>().getTotalPrice();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff003049),
            title: const Text(
              "Truck Cart Summary",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffE0E7EF), Color(0xffF8FAFC)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return Card(
                        color: Colors.white,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        elevation: 4,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.orange.shade300,
                            child: Icon(Icons.local_shipping, color: Colors.white),
                          ),
                          title: Text(
                            item.product.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          subtitle: Text(
                            "Rp ${item.product.price} x ${item.quantity}",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.red),
                                  onPressed: () {
                                    context.read<CartCubit>().updateQuantity(
                                          item.product,
                                          item.quantity - 1,
                                        );
                                  }),
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              IconButton(
                                  icon: const Icon(Icons.add, color: Colors.green),
                                  onPressed: () {
                                    context.read<CartCubit>().updateQuantity(
                                          item.product,
                                          item.quantity + 1,
                                        );
                                  }),
                              IconButton(
                                icon: const Icon(Icons.delete_forever,
                                    color: Colors.black),
                                onPressed: () {
                                  context.read<CartCubit>()
                                      .removeFromCart(item.product);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Total Price
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: Color(0xff003049),
                  ),
                  width: double.infinity,
                  child: Text(
                    "Total: Rp $total",
                    style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
