import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryData> _categoryData = [
    CategoryData('Books', 'assets/images/book.png'),
    CategoryData('Electronics', 'assets/images/electronics.png'),
    CategoryData('Furniture', 'assets/images/furniture.png'),
    CategoryData('Laptop', 'assets/images/laptop.png'),
    CategoryData('Mobile', 'assets/images/mobile.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shop Used Items',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Products Menu',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 215, 214, 214))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 214, 213, 213))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        print(_categoryData[index].name);
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            _categoryData[index].imagePath,
                            height: 50,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(_categoryData[index].name),
                          )
                        ],
                      ),
                    ),
                    itemCount: _categoryData.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // elevation: 50,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
                const SizedBox.shrink(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryData {
  CategoryData(this.name, this.imagePath);
  final String name;
  final String imagePath;
}
