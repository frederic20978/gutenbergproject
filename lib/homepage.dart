import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenbergproject/common.dart';
import 'package:gutenbergproject/sectionpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cats = categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: Text("Gutenberg Project",
                style: heading1.copyWith(color: primary)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: Text(
                "A social cataloging website that allows you to freely search its database of books,annotations, and reviews.",
                style: bodyfont.copyWith(color: grey3)),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cats.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SectionPage(section: cats[index])));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(128, 211, 209, 238),
                                offset: Offset(2, 5),
                                blurRadius: 6, // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Colors.white),
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  cats[index]["svg"],
                                  width: 30,
                                  height: 30,
                                ),
                                Container(
                                  // height: 50,
                                  width: 10,
                                ),
                                Text(
                                  cats[index]["name"],
                                  style: genrecardfont.copyWith(color: grey3),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              "assets/provided/Next.svg",
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      )),
    );
  }
}
