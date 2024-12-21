import 'package:flutter/material.dart';

class Batee5Banner extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  Batee5Banner({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        debugPrint('banner tapped');
      },
      child: Column(
        children: [
          Container(
            width: width * 0.914,
            height: width * .36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.018),
              image: DecorationImage(
                image: imagePath.startsWith("http")
                    ? NetworkImage(imagePath) as ImageProvider
                    : AssetImage(imagePath) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: width * 0.914,
                  height: width * .36,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(230, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Row(),
                      SizedBox(width: width * .025),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: width * .04),
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: width * .025),
                          Text(
                            subTitle,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: width * 0.032,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
