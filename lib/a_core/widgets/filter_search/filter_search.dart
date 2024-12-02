import 'package:batee5/a_core/widgets/batee5_search_bar.dart';
import 'package:batee5/a_core/widgets/filter_search/components/search_section.dart';
import 'package:flutter/material.dart';

class FilterSearch extends StatelessWidget {
  final List<Widget> sections;
  final String hintText;
  FilterSearch({super.key, required this.sections, required this.hintText});

  double width = 0;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    width =
        MediaQuery.of(context).size.width > 300
            ? 300
            : MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: width * .0426),
              Batee5SearchBar(
                onChanged: (p0) {
                  //TODO: filter the search
                  debugPrint(p0);
                },
                controller: controller,
                hintText: hintText,
              ),
              SizedBox(width: width * .0426),
              GestureDetector(
                onTap: () {
                  controller.clear();
                },
                child: Text(
                  'Clear',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: width * .0426,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(children: [...sections]),
        ],
      ),
    );
  }
}
