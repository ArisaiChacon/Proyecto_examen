import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final List<CartItem> cartItems = [
    CartItem(
      name: 'Tarta de Chocolate',
      code: '#123456',
      price: 25.99,
      quantity: 1,
      imageUrl: 'lib/assets/tarta_chocolate.jpg',
    ),
    CartItem(
      name: 'Pastel de Fresa',
      code: '#789012',
      price: 19.99,
      quantity: 2,
      imageUrl: 'lib/assets/pastel_fresa.jpg',
    ),
    CartItem(
      name: 'Cheesecake de Frutos del Bosque',
      code: '#345678',
      price: 32.50,
      quantity: 1,
      imageUrl: 'lib/assets/cheesecake_frutos.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
        backgroundColor: Colors.brown[400], // Color de fondo café para el appbar
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: CartItemWidget(
              item: cartItems[index],
              onQuantityChanged: (newQuantity) {
                setState(() {
                  cartItems[index].quantity = newQuantity;
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[400], // Color de fondo café para la barra inferior
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL:',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white), // Texto blanco para contraste
                    ),
                    Text(
                      '\$${calculateTotal().toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white), // Texto blanco para contraste
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.brown[600] ?? Colors.brown), // Botón con tono más oscuro
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    ),
                  ),
                  child: Text('Checkout', style: TextStyle(fontSize: 18.0)),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.brown[600] ?? Colors.brown), // Botón con tono más oscuro
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    ),
                  ),
                  child: Text('Checkout with PayPal', style: TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateTotal() {
    double total = 0;
    for (CartItem item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  final String name;
  final String code;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.code,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class CartItemWidget extends StatefulWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;

  CartItemWidget({
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(widget.item.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Code: ${widget.item.code}'),
                  Text('\$${widget.item.price.toStringAsFixed(2)}'),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (widget.item.quantity > 1) {
                            widget.onQuantityChanged(widget.item.quantity - 1);
                          }
                        },
                      ),
                      Text('${widget.item.quantity}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          widget.onQuantityChanged(widget.item.quantity + 1);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
        backgroundColor: Colors.brown[400], 
      ),
      body: Center(
        child: Text('Contenido del carrito de compras', style: TextStyle(fontSize: 20.0)),
      ),
    );
  }
}
