import 'package:flutter/material.dart';
import 'package:flutter_intern_utkersh/components/ad_preview_container.dart';

import '../constants.dart';

class AllAdsArguments {
  final int index;
  AllAdsArguments(this.index);
}

class AllAds extends StatelessWidget {
  final AllAdsArguments arguments;
  AllAds(this.arguments);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: arguments.index,
        length: 4,
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                //Container for icon, search ads bar, and 'Ads' text
                Expanded(
                  flex: 4,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.menu,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 5.0,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.orangeAccent.shade100
                                      .withOpacity(0.5),
                                  border: InputBorder.none,
                                  hintText: 'Search Ads...',
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Ads',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //Container for Tabs
                Expanded(
                  flex: 2,
                  child: TabBar(labelColor: Colors.black, tabs: [
                    Tab(
                      text: 'Pending',
                    ),
                    Tab(
                      text: 'Rejected',
                    ),
                    Tab(
                      text: 'Approved',
                    ),
                    Tab(
                      text: 'All',
                    ),
                  ]),
                ),
                Expanded(
                  flex: 28,
                  child: Container(
                    child: TabBarView(
                      children: [
                        SizedBox.expand(),
                        SizedBox.expand(),
                        SizedBox.expand(),
                        SingleChildScrollView(
                          child: Wrap(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: AdPreviewContainer(
                                        index: 1, adStatus: AdStatus.pending)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: AdPreviewContainer(
                                        index: 0, adStatus: AdStatus.approved)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: AdPreviewContainer(
                                        index: 0, adStatus: AdStatus.rejected)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
