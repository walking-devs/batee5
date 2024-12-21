import 'package:batee5/features/change_location/widgets/location_picker.dart';
import 'package:batee5/a_core/widgets/filter_search/components/search_section.dart';
import 'package:batee5/a_core/widgets/filter_search/filter_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangeLocation extends StatelessWidget {
  ChangeLocation({super.key});
  List<String> cities = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Luxor',
    'Cairo',
    'Alexandria',
    'Giza',
    'Luxor',
    'Cairo',
    'Alexandria',
    'Giza',
    'Luxor',
    'Aswan',
    'Cairo',
    'Alexandria',
    'Giza',
    'Luxor',
    'Aswan',
  ];
  List<String> lastSearched = ['Cairo', 'Alexandria'];

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
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close, size: 24),
                      ),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    FilterSearch(
                      hintText: 'Search city or country',
                      sections: [
                        LocationPicker(),
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
                          title: "Choose Region",
                          onItmePressed: (index) {
                            //TODO: add bloc to save region
                            debugPrint('region ${cities[index]} chosen');
                          },
                          items: cities,
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
