import 'package:flutter/material.dart';

class ListingBottomSheet extends StatefulWidget {
  final BuildContext receivedContext;
  ListingBottomSheet({this.receivedContext});
  @override
  _ListingBottomSheetState createState() => _ListingBottomSheetState();
}

class _ListingBottomSheetState extends State<ListingBottomSheet> {
  bool textVisible = false;
  String dropdownValue = 'Please select a category';

  @override
  Widget build(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Container(
        height: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Done!'),
            Expanded(
              child: Icon(
                Icons.check_circle,
                color: Colors.lightGreen.shade600,
                size: 30.0,
              ),
            )
          ],
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'The Ad is successfully',
              style: TextStyle(fontSize: 12.0),
            ),
            Text(
              'Approved',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
      actions: [
        RaisedButton(
          onPressed: () {
            Navigator.popUntil(
                context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.lightGreen.shade600,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30.0,
            child: Text(
              'Okay',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (bottomContext) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                              ),
                              Text(
                                'Approve Ad',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                          ),
                          Text(
                            'Are you sure you want to approve this ad?',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Note: This action will notify user the ad is approved and be visible to other users',
                            style: TextStyle(
                              color: Colors.red.shade600,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.start,
                            softWrap: true,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return dialog;
                                  });
                            },
                            color: Colors.green,
                            child: Text(
                              'Approve',
                              textAlign: TextAlign.center,
                            ),
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0))),
                );
              },
              child: Align(child: Text('Approve')),
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (bottomContext) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reject Ad',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                              ),
                            ],
                          ),
                          Text(
                            'Are you sure you want to reject this ad?',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Pick Ad Rejection Reason',
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                              // Material(
                              //   elevation: 5.0,
                              //   child: Container(
                              //     height: 50.0,
                              //     width: double.infinity,
                              //   ),
                              // )
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    textVisible = !textVisible;
                                  });
                                },
                                child: Material(
                                  elevation: 5.0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60.0,
                                    child: Row(
                                      children: [
                                        Opacity(
                                          opacity: textVisible ? 1.0 : 0.0,
                                          child: Text('Category Mismatch'),
                                        ),
                                        Icon(Icons.arrow_drop_down),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Note: This action will notify user the ad is rejected and be visible to other users',
                            style: TextStyle(
                              color: Colors.red.shade600,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.start,
                            softWrap: true,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return dialog;
                                  });
                            },
                            color: Colors.blue,
                            child: Text(
                              'Reject',
                              textAlign: TextAlign.center,
                            ),
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0))),
                );
              },
              child: Align(child: Text('Reject')),
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        )
      ],
    );
  }
}
