import 'package:flutter/material.dart';
import 'file:///C:/Users/KRITIKA-PC/AndroidStudioProjects/flutter_intern_utkersh/lib/screens/listing_bottomsheet.dart';
import '../constants.dart';

class ScreenArguments {
  final int index;
  ScreenArguments(this.index);
}

class Listing extends StatefulWidget {
  final ScreenArguments arguments;
  Listing(this.arguments);

  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  bool wrapValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 65.0,
        child: ListingBottomSheet(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SizedBox(
                        height: 200.0,
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Image(
                                image: AssetImage(
                                    kAdList[widget.arguments.index]['img'])))),
                  ),
                  //Row for 'Pending' and 'Price'
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5.0)
                            ],
                            color: Colors.lightBlue,
                          ),
                          child: Text(
                            'Pending',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'OMR ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${kAdList[widget.arguments.index]['price']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '1 day ago',
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //Container for Text title
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      kAdList[widget.arguments.index]['title'],
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //Description Column
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 3.0),
                          child: Text(
                            'Description',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              wrapValue = !wrapValue;
                            });
                          },
                          child: Text(
                            kAdList[widget.arguments.index]['description'],
                            softWrap: wrapValue,
                            textAlign: TextAlign.start,
                            overflow: wrapValue ? null : TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text(
                                    'Category',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange.shade800,
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5.0)
                                    ]),
                                child: Text(
                                  kAdList[widget.arguments.index]['category'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: kAdList[widget.arguments.index]
                                      ['subcategory'] ==
                                  null
                              ? 0.0
                              : 1.0,
                          child: Container(
                            width: 100.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: Text('Sub Category')),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange.shade800,
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 5.0)
                                      ]),
                                  child: Text(
                                    kAdList[widget.arguments.index]
                                                ['subcategory'] ==
                                            null
                                        ? ''
                                        : kAdList[widget.arguments.index]
                                            ['subcategory'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Opacity(
                          opacity:
                              kAdList[widget.arguments.index]['type'] == null
                                  ? 0.0
                                  : 1.0,
                          child: Container(
                            width: 100.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: Text('Type/Make')),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange.shade800,
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 5.0)
                                      ]),
                                  child: Text(
                                    kAdList[widget.arguments.index]['type'] ==
                                            null
                                        ? ''
                                        : kAdList[widget.arguments.index]
                                            ['type'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Ad Location',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  kAdList[widget.arguments.index]['location'],
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Ad Poster Info',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 40.0,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        kAdList[widget.arguments.index]
                                            ['seller-name'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            kAdList[widget.arguments.index]
                                                ['seller-email'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          Icon(
                                            Icons.mail,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            kAdList[widget.arguments.index]
                                                ['seller-phone'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          Icon(
                                            Icons.phone,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
