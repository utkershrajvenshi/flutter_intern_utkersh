import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_utkersh/components/category_container.dart';
import 'package:flutter_intern_utkersh/constants.dart';

class AdPreviewContainer extends StatelessWidget {
  final int index;
  final AdStatus adStatus;

  AdPreviewContainer({this.index, this.adStatus});

  @override
  Widget build(BuildContext context) {
    List<String> resources = [
      kAdList[index]['img'],
      kAdList[index]['title'],
      kAdList[index]['description'],
      kAdList[index]['category'],
      kAdList[index]['price']
    ];
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 5.0,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 150.0,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image(image: AssetImage(resources[0])),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 40.0,
                    height: 25.0,
                    padding: EdgeInsets.all(2.0),
                    color: adStatus == AdStatus.pending
                        ? Colors.blue
                        : adStatus == AdStatus.rejected
                            ? Colors.red
                            : Colors.green,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        adStatus == AdStatus.pending
                            ? 'Pending'
                            : adStatus == AdStatus.rejected
                                ? 'Rejected'
                                : 'Approved',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            //Title of Ad
            Text(
              resources[1],
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            //Description of Ad
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                resources[2],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontSize: 10.0, color: Colors.black),
            ),
            Container(
              width: 95.0,
              child: CategoryContainer(
                status: AdStatus.pending,
                label: resources[3],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              // child: Text('OMR ${resources[4]}',
              //     textAlign: TextAlign.end,
              //     style: Theme.of(context).textTheme.subtitle2),
              child: RichText(
                text: TextSpan(
                  text: 'OMR ',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 15.0, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: '${resources[4]}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '1 day ago',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
