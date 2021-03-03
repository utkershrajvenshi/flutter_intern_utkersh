import 'package:flutter/material.dart';
import 'package:flutter_intern_utkersh/components/ad_preview_container.dart';
import 'package:flutter_intern_utkersh/components/ad_status_tile.dart';
import 'package:flutter_intern_utkersh/components/category_container.dart';
import 'package:flutter_intern_utkersh/constants.dart';
import 'package:flutter_intern_utkersh/screens/listing.dart';

import 'all_ads.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //Row in Container for Dashboard
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.deepOrange,
                    ),
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
              //Row for Search bar and View All Ads
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 5.0,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Colors.orangeAccent.shade100.withOpacity(0.5),
                            border: InputBorder.none,
                            hintText: 'Search Ads...',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(5.0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/2',
                              arguments: AllAdsArguments(3));
                        },
                        color: Colors.deepOrange,
                        child: Text(
                          'View All Ads',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontSize: 10.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Column for Total Ads
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //For text 'Total Ads'
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: Text(
                      'Total Ads',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ),
                  //Row for Ad Status Tiles
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/2',
                                  arguments: AllAdsArguments(2));
                            },
                            child: AdStatusTile(
                              receivedAdStatus: AdStatus.approved,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/2',
                                  arguments: AllAdsArguments(1));
                            },
                            child: AdStatusTile(
                              receivedAdStatus: AdStatus.rejected,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/2',
                                  arguments: AllAdsArguments(0));
                            },
                            child: AdStatusTile(
                              receivedAdStatus: AdStatus.pending,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Column for Pending by Categories
              Column(
                children: [
                  //Row for 'Pending By Categories' and 'See more' button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Container for Text
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text(
                          'Pending By Categories',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'See more',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.lightGreen),
                        ),
                      ),
                    ],
                  ),
                  //Row for showing pending categories
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CategoryContainer(
                                  status: AdStatus.approved, label: 'Cars'),
                              CategoryContainer(
                                  status: AdStatus.approved,
                                  label: 'Electronic'),
                              CategoryContainer(
                                  status: AdStatus.approved, label: 'Laptops'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CategoryContainer(
                                  status: AdStatus.rejected,
                                  label: 'Properties'),
                              CategoryContainer(
                                  status: AdStatus.rejected, label: 'Mobile'),
                              CategoryContainer(
                                  status: AdStatus.rejected, label: 'Lands'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CategoryContainer(
                                  status: AdStatus.pending, label: 'Jobs'),
                              CategoryContainer(
                                  status: AdStatus.pending, label: 'Watches'),
                              CategoryContainer(
                                  status: AdStatus.pending, label: 'Apple'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //Column for Pending Ads
              Column(
                children: [
                  //Row for 'Pending Ads' and 'See More' button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text('Pending Ads',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                      ),
                      FlatButton(
                        onPressed: null,
                        child: Text(
                          'See more',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.lightGreen),
                        ),
                      ),
                    ],
                  ),
                  //Pending Ads go into this Row below
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/1',
                                  arguments: ScreenArguments(0));
                            },
                            child: Container(
                                margin: EdgeInsets.all(5.0),
                                child: AdPreviewContainer(
                                  index: 0,
                                  adStatus: AdStatus.pending,
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/1',
                                  arguments: ScreenArguments(1));
                            },
                            child: Container(
                                margin: EdgeInsets.all(5.0),
                                child: AdPreviewContainer(
                                    index: 1, adStatus: AdStatus.pending)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
