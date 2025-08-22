import 'package:first_app/custom_button.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('متجرنا'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أهلاً بك في متجرنا',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // فئات المنتجات
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(icon: Icons.phone_iphone, title: 'هواتف'),
                  CategoryCard(icon: Icons.laptop, title: 'لابتوبات'),
                  CategoryCard(icon: Icons.headset, title: 'إكسسوارات'),
                  CategoryCard(icon: Icons.tv, title: 'أجهزة منزلية'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'المنتجات المميزة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: [
                  ProductCard(
                    name: 'هاتف ذكي',
                    price: '2500 ر.س',
                    image: 'https://via.placeholder.com/150',
                  ),
                  ProductCard(
                    name: 'سماعات لاسلكية',
                    price: '500 ر.س',
                    image: 'https://via.placeholder.com/150',
                  ),
                  ProductCard(
                    name: 'ساعة ذكية',
                    price: '800 ر.س',
                    image: 'https://via.placeholder.com/150',
                  ),
                  ProductCard(
                    name: 'لابتوب',
                    price: '3500 ر.س',
                    image: 'https://via.placeholder.com/150',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'السلة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 5),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: TextStyle(color: Colors.blue)),
                SizedBox(height: 5),
                CustomButton(
                  text: 'إضافة إلى السلة',
                  onPressed: () {},
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}