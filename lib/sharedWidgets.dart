import 'package:flutter/material.dart';
import 'package:gutenbergproject/common.dart';
import 'package:gutenbergproject/models.dart';
import 'package:url_launcher/url_launcher.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            bool opened = false;
            if (!opened) {
              for (var key in book.formats.keys) {
                if (key.contains("text/html")) {
                  launch(book.formats[key]);
                  opened = true;
                }
              }
            }
            if (!opened) {
              for (var key in book.formats.keys) {
                if (key.contains("application/pdf")) {
                  opened = true;
                }
              }
            }
            if (!opened) {
              for (var key in book.formats.keys) {
                if (key.contains("text/plain")) {
                  opened = true;
                }
              }
            }
          },
          child: Container(
            height: 162,
            width: 114,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  image: NetworkImage(book.image), fit: BoxFit.fill),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Flexible(
          child: Text(
            book.title.isNotEmpty ? book.title : "No title",
            // "hi",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: bookheading.copyWith(color: grey3),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          book.authors.isNotEmpty ? book.authors[0]["name"] : "No author",
          // "hi",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: bookheading.copyWith(color: grey2),
        )
      ],
    );
  }
}
