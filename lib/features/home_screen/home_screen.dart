import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/custom_app_bar_leading.dart';
import 'package:batee5/features/home_screen/widgets/banner_scroller/banner.dart';
import 'package:batee5/features/home_screen/widgets/banner_scroller/banner_scroller.dart';
import 'package:batee5/features/home_screen/widgets/location_selector.dart';
import 'package:batee5/features/home_screen/widgets/preview_section/preview_section.dart';
import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/batee5_app_bar.dart';
import 'package:batee5/a_core/widgets/batee5_search_bar.dart';
import 'package:batee5/a_core/widgets/product_card/product_card.dart';
import 'package:batee5/a_core/widgets/svg_button.dart';
import 'package:flutter/material.dart';
import 'package:batee5/a_core/services/api_service.dart';
import 'package:batee5/data/models/category.dart';
import 'package:batee5/data/models/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  Map<String, Category> categories = {};
  Map<String, Product> products = {};
  String selectedCategory = 'electronics';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final cats = await _apiService.getCategories();
      final prods = await _apiService.getProductsByCategory(selectedCategory);

      setState(() {
        categories = cats;
        products = prods;
      });
    } catch (e) {
      // Handle error
      debugPrint(e.toString());
    }
  }

  Future<void> _toggleFavorite(String productId) async {
    try {
      final newStatus =
          await _apiService.toggleFavorite(selectedCategory, productId);
      setState(() {
        products[productId]?.isFavorite = newStatus;
      });
    } catch (e) {
      // Handle error
      debugPrint(e.toString());
    }
  }

  double height = 0;
  double width = 0;
  String imageUrl = 'assets/images/fashion.jpg';
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: width > 1200 ? width : 1200,
                child: Column(
                  children: [
                    Batee5AppBar(
                      toolbarHeight: 60,
                      title: CustomAppBarLeading(
                        midText: "Batee5",
                        midTextColor: AppColors.lightGreen,
                      ),
                      barHeight: 60,
                      actions: [
                        Row(
                          children: [
                            LocationSelector(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/location');
                                debugPrint('location pressed');
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/search');
                              },
                              child: Batee5SearchBar(
                                enabled: false,
                                hintText: "What are you looking for?",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          // BannerScroller(
                          //   banners: [
                          //     Batee5Banner(
                          //       imagePath: 'assets/images/sofa.jpeg',
                          //       title: 'best furniture items',
                          //       subTitle: 'Cairo, Egypt',
                          //     ),
                          //     Batee5Banner(
                          //       imagePath: 'assets/images/sofa.jpeg',
                          //       title: 'best furniture items',
                          //       subTitle: 'Cairo, Egypt',
                          //     ),
                          //     Batee5Banner(
                          //       imagePath: 'assets/images/sofa.jpeg',
                          //       title: 'best furniture items',
                          //       subTitle: 'Cairo, Egypt',
                          //     ),
                          //   ],
                          // ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.filled(
                                    8,
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 22,
                                            foregroundImage:
                                                imageUrl.startsWith('http')
                                                    ? NetworkImage(imageUrl)
                                                        as ImageProvider
                                                    : AssetImage(imageUrl)
                                                        as ImageProvider,
                                          ),
                                          Text(
                                            'category',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          PreviewSection(
                            spacing: 35,
                            crossAxisCount: 3,
                            title: 'Special Items',
                            fullItemCount: products.length,
                            items: products.values
                                .map((product) => Column(
                                      children: [
                                        ProductCard(
                                          id: product.id,
                                          category: product.category,
                                          size: 300,
                                          onPressed: () {
                                            debugPrint('product pressed');
                                          },
                                          onFavoriteToggled: (bool newStatus) {
                                            _toggleFavorite(product.id);
                                          },
                                          isFavorite: product.isFavorite,
                                          imageUrl: product.imageUrl,
                                          title: product.title,
                                          description: product.description,
                                          price: product.price,
                                          location: product.location,
                                          dateListed: product.dateListed,
                                          area: product.area,
                                          numberOfBedrooms:
                                              product.numberOfBedrooms,
                                          numberOfBathrooms:
                                              product.numberOfBathrooms,
                                        ),
                                      ],
                                    ))
                                .toList(),
                            mainAxisExtent: width * .47,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
