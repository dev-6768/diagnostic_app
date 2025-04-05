import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {

  String _response = "Press the button to fetch data.";

  Future<void> addToCart() async {
    final url = Uri.parse('https://sanitascare.health/webservice/service.php?action=add_to_cart&user_id=1&unique_id=11111111111&test_name=abc&quantity=1&test_price=299');
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        setState(() {
          _response = res.body;
        });
      } else {
        setState(() {
          _response = 'Error: ${res.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Exception: $e';
      });
    }
  }


  Future<void> viewCart() async {
    final url = Uri.parse('https://sanitascare.health/webservice/service.php?action=view_cart&user_id=1&unique_id=11111111111');
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        setState(() {
          _response = res.body;
        });
      } else {
        setState(() {
          _response = 'Error: ${res.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Exception: $e';
      });
    }
  }


  Future<void> deleteFromCart() async {
    final url = Uri.parse('https://sanitascare.health/webservice/service.php?action=delete_item&cart_id=1');
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        setState(() {
          _response = res.body;
        });
      } else {
        setState(() {
          _response = 'Error: ${res.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Exception: $e';
      });
    }
  }


  Future<void> updateCart() async {
    final url = Uri.parse('https://sanitascare.health/webservice/service.php?action=delete_item&cart_id=1');
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        setState(() {
          _response = res.body;
        });
      } else {
        setState(() {
          _response = 'Error: ${res.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Exception: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Add to cart"),
                onPressed: () async {
                  await addToCart();
                },
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                child: Text("Update to cart"),
                onPressed: () async {
                  await updateCart();
                },
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                child: Text("Delete to cart"),
                onPressed: () async {
                  await deleteFromCart();
                },
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                child: Text("View to cart"),
                onPressed: () async {
                  await viewCart();
                },
              ),

              const SizedBox(height: 40),

              Text("Response here : $_response")
            ],
          )
          ,
        )
      ),
    );
  }
}