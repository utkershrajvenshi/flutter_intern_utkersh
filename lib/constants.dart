import 'package:flutter/material.dart';

enum AdStatus { approved, rejected, pending }

const Map<AdStatus, Color> kColorMap = {
  AdStatus.approved: Colors.green,
  AdStatus.rejected: Colors.blue,
  AdStatus.pending: Colors.deepOrange,
};

const List<Map<String, String>> kAdList = [
  {
    'title': 'MacBook 2016 on Sale at Lowest Cost',
    'img': 'images/laptop.jpeg',
    'description':
        'Latest laptop at cheapest cost, 512 tb storage, 32gb RAM, Latest Processor, Used for only 1 month. Great deal! grab it quickly. You will not find a better deal anywhere else.',
    'category': 'Electronic',
    'subcategory': 'Laptop',
    'type': 'Apple',
    'price': '2125',
    'location':
        'Sr. No. 280/1A, Sathe Wasti, Loheagaon, Pune, Maharashtra, India - 411047',
    'seller-name': 'Jitendra Choudhary',
    'seller-email': 'Jitendra93266@gmail.com',
    'seller-phone': '9623876634'
  },
  {
    'title': 'Car for sale',
    'img': 'images/car.png',
    'description':
        'Good condition car available for sale. Volkswagen Vento 2010-2013 Petrol Highline, 2015, Petrol. Mildly used. With ABS.',
    'category': 'Cars',
    'subcategory': null,
    'type': null,
    'price': '225',
    'location':
        'Sr. No. 280/1A, Sathe Wasti, Loheagaon, Pune, Maharashtra, India - 411047',
    'seller-name': 'Jitendra Choudhary',
    'seller-email': 'Jitendra93266@gmail.com',
    'seller-phone': '9623876634'
  }
];
