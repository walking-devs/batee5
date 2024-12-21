import 'package:batee5/a_core/widgets/filter_search/components/search_section.dart';
import 'package:batee5/a_core/widgets/filter_search/filter_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  List<String> categories = [
    'Electronics',
    'Fashion',
    'Home',
    'Beauty',
    'Toys',
    'Books',
    'Sports',
    'Health',
    'Cars',
    'Services',
    'Jobs',
    'Real Estate',
    'Other',
  ];
  List<String> lastSearched = ['Iphone 12', 'Samsung Galaxy S21'];

  double width = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width > 300
        ? 300
        : MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: width > 1200 ? width : 1200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      leading: GestureDetector(
                        onTap: () {
                          //Todo: add bloc to unfocus search bar
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close, size: 24),
                      ),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    FilterSearch(
                      hintText: 'What are you looking for ?',
                      sections: [
                        SearchSection(
                          title: "Last Searched",
                          onItmePressed: (index) {
                            // TODO: add bloc to save last searched
                            debugPrint('last searched pressed');
                          },
                          items: lastSearched,
                          leading: SvgPicture.asset(
                            'assets/icons/clock.svg',
                            width: width * .0426,
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              // TODO: add bloc to delete element
                              debugPrint('delete element');
                            },
                            child: Icon(Icons.close, size: width * .0426),
                          ),
                        ),
                        SearchSection(
                          title: "Categories",
                          onItmePressed: (index) {
                            debugPrint('region ${categories[index]} chosen');
                          },
                          items: categories,
                          trailing: Icon(Icons.arrow_forward_ios_sharp,
                              size: width * .0426),
                        ),
                      ],
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
