import 'package:ecommerce_app_opensrc/data/dummy_products.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
                (route) => false,
              );
            },
          ),
        ],
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
      ),
      body: const Column(
        children: [
          Expanded(child: _CartList()),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: const CircleAvatar(
            maxRadius: 50,
            backgroundImage: AssetImage(
              'assets/dummycart.jpg',
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_circle_outline_rounded, size: 30),
          ),
          title: Text(
            dummyProducts[index].name.toString(),
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          subtitle: Text(dummyProducts[0].price.toString()),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "₹ XXX",
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Buy",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        ],
      ),
    );
  }
}
