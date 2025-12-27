import 'package:flutter/material.dart';
import 'package:yammiego/Model/food.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  List<Food> foodList = [
    Food(
      id: 1,
      name: "Burger",
      image:
          "https://thumbs.dreamstime.com/b/tasty-burger-french-fries-fire-close-up-home-made-flames-137249900.jpg",
      price: 120,
    ),
    Food(
      id: 2,
      name: "Pizza",
      image:
          "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg",
      price: 250,
    ),
    Food(
      id: 3,
      name: "Sandwich",
      image:
          "https://media.istockphoto.com/id/1256670482/photo/turkey-sandwich-with-tomato-and-lettuce.jpg",
      price: 90,
    ),
    Food(
      id: 4,
      name: "Fried Chicken",
      image:
          "https://media.istockphoto.com/id/1408338331/photo/crispy-fried-chicken-in-the-basket.jpg",
      price: 180,
    ),
  ];

  final List<String> restaurantImages = [
    "https://images.unsplash.com/photo-1555396273-367ea4eb4db5",
    "https://images.unsplash.com/photo-1552566626-52f8b828add9",
    "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
  ];

  final List<String> foodBanners = [
    "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe",
    "https://images.unsplash.com/photo-1555939594-58d7cb561ad1",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// 🔹 Header
          Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, top: 60, right: 16),
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Food Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Restaurant Carousel
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Popular Restaurants",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.9),
                      itemCount: restaurantImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              restaurantImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  /// 🔹 Food Carousel
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Today's Specials",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.85),
                      itemCount: foodBanners.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              foodBanners[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Order Now",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),

                  /// 🔹 Food Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: foodList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                foodList[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              foodList[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "₹ ${foodList[index].price}",
                              style: const TextStyle(color: Colors.green),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
