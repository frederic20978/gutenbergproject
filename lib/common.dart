import 'package:flutter/material.dart';

Color primary = const Color(0xFF5E56E7);
Color primary1 = const Color(0xFFF8F7FF);
Color grey1 = const Color(0xFFF0F0F6);
Color grey2 = const Color(0xFFA0A0A0);
Color grey3 = const Color(0xFF333333);

const heading1 = TextStyle(
    fontSize: 40,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0);

const heading2 = TextStyle(
    fontSize: 30,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0);

const genrecardfont =
    TextStyle(fontSize: 20, fontFamily: 'Montserrat', letterSpacing: 1.0);

const searchboxfont =
    TextStyle(fontSize: 16, fontFamily: 'Montserrat', letterSpacing: 1.0);

const bodyfont =
    TextStyle(fontSize: 16, fontFamily: 'Montserrat', letterSpacing: 1.0);

const bookheading =
    TextStyle(fontSize: 12, fontFamily: 'Montserrat', letterSpacing: 1.0);

List categories = [
  {
    "name": "Fiction",
    "svg": "assets/provided/Fiction.svg",
    "url": "http://gutendex.com/books?topic=fiction&mime_type=image%2fjpeg"
  },
  {
    "name": "Drama",
    "svg": "assets/provided/Drama.svg",
    "url": "http://gutendex.com/books?topic=drama&mime_type=image%2fjpeg"
  },
  {
    "name": "Humor",
    "svg": "assets/provided/Humour.svg",
    "url": "http://gutendex.com/books?topic=humor&mime_type=image%2fjpeg"
  },
  {
    "name": "Politics",
    "svg": "assets/provided/Politics.svg",
    "url": "http://gutendex.com/books?topic=politics&mime_type=image%2fjpeg"
  },
  {
    "name": "Philosophy",
    "svg": "assets/provided/Philosophy.svg",
    "url": "http://gutendex.com/books?topic=philosophy&mime_type=image%2fjpeg"
  },
  {
    "name": "History",
    "svg": "assets/provided/History.svg",
    "url": "http://gutendex.com/books?topic=history&mime_type=image%2fjpeg"
  },
  {
    "name": "Adventure",
    "svg": "assets/provided/Adventure.svg",
    "url": "http://gutendex.com/books?topic=adventure&mime_type=image%2fjpeg"
  },
];
