// ignore_for_file: prefer_const_constructors

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(0),
                        primary: Colors.black,
                        elevation: 0),
                    onPressed: () {},
                    child: Icon(Icons.add),
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
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
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
                    ),
                    const Text(
                      'Popular Choices',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/mobile.png'),
                                Text(
                                  'IPhone',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₹25000',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border_outlined,
                                        size: 20,
                                        // color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Visit Item'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all items...',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
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
                  // const SizedBox.shrink(),
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
      ),
    );
  }
}

class CategoryData {
  CategoryData(this.name, this.imagePath);
  final String name;
  final String imagePath;
}
