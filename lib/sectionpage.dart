import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenbergproject/common.dart';
import 'package:gutenbergproject/database.dart';
import 'package:gutenbergproject/models.dart';
import 'package:gutenbergproject/sharedWidgets.dart';

class SectionPage extends StatefulWidget {
  final section;

  SectionPage({required this.section});

  @override
  State<SectionPage> createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
  ScrollController? controller;
  List<Book> books = [];
  bool loading = true;
  bool loadingMore = false;
  bool searchflag = false;
  String nextArray = "http://gutendex.com/books";
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      setState(() {
        nextArray = widget.section["url"];
        getMoreItems();
        loading = false;
      });
    }
    if (searchflag) {
      setState(() {
        getMoreItems();
        searchflag = false;
      });
    }
    return loading
        ? Container()
        : GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SafeArea(
                  child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.maybePop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: primary,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.section["name"],
                          style: heading2.copyWith(color: primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: grey1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        child: TextFormField(
                          controller: textController,
                          style: searchboxfont.copyWith(color: grey3),
                          decoration: InputDecoration(
                            prefix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  searchflag = true;
                                  nextArray = widget.section["url"] +
                                      "&search=" +
                                      textController.text;
                                  books = [];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  "assets/provided/Search.svg",
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  textController.clear();
                                  loading = true;
                                  nextArray = widget.section["url"];
                                  books = [];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  "assets/provided/Cancel.svg",
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                color: grey1,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                color: primary,
                                width: 1.0,
                              ),
                            ),
                            hintText: 'Search',
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        color: grey1,
                        padding: const EdgeInsets.all(10),
                        child: GridView.count(
                          controller: controller,
                          childAspectRatio: 0.5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children: List.generate(
                            books.length,
                            (index) {
                              return BookCard(book: books[index]);
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          );
  }

  void getMoreItems() async {
    if (nextArray != "finished") {
      List<Book> temp = await getSectionItems(nextArray, setStateFunction);
      books.addAll(temp);
    }
  }

  void setStateFunction(x, y) {
    setState(() {
      loadingMore = x;
      nextArray = y;
    });
  }

  void _scrollListener() {
    if ((controller!.position.extentAfter < 500) & !loadingMore) {
      getMoreItems();
      setState(() {
        loadingMore = true;
      });
    }
  }
}
