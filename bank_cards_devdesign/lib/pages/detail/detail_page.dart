import 'package:bank_cards_devdesign/components/card/back_card.dart';
import 'package:bank_cards_devdesign/components/card/front_card.dart';
import 'package:bank_cards_devdesign/components/flippable_widget.dart';
import 'package:bank_cards_devdesign/models/credit_card.dart';
import 'package:bank_cards_devdesign/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/transaction_summary.dart';

class DetailPage extends StatefulWidget {
  final CreditCard card;

  const DetailPage({Key key, @required this.card}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: SizeConfig.defaultHeight * 4,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.defaultWidth * 2),
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: SizeConfig.defaultHeight * 4,
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _buildHeader(),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultWidth * 2),
                child: FlippableWidget(
                    frontWidget: FrontCard(card: widget.card),
                    backWidget: BackCard(card: widget.card)),
              )),
          _buildBottomSheet(),
        ],
      ),
    );
  }

  _buildHeader() => Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "Full Card",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: SizeConfig.defaultHeight * 1.5,
            ),
            Text(
              "Rotate the card to view the security code",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white60),
            )
          ],
        ),
      );

  _buildBottomSheet() => Align(
        alignment: Alignment.bottomCenter,
        child: SlidingSheet(
            color: sheetColor,
            cornerRadius: SizeConfig.defaultWidth * 2.5,
            snapSpec: SnapSpec(
                snap: true,
                snappings: [0.3, 0.6, 1],
                positioning: SnapPositioning.relativeToAvailableSpace),
            headerBuilder: (context, state) {
              return Container(
                height: SizeConfig.defaultHeight * 7,
                width: double.infinity,
                color: sheetColor,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultWidth * 2,
                      // vertical: SizeConfig.defaultHeight
                  ),
                  child: Text(
                    "Today",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            builder: (context, state) {
              return Container(
                  color: sheetColor,
                  child: ListView.builder(
                    itemCount: transactions.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TransactionSummary(
                        transaction: transactions[index],
                      );
                    },
                  ));
            }),
      );
}

// _buildBottomSheet() => Align(
//   alignment: Alignment.bottomCenter,
//   child: SlidingSheet(
//       color: sheetColor,
//       cornerRadius: SizeConfig.defaultWidth * 2.5,
//       snapSpec: SnapSpec(
//           snap: true,
//           snappings: [0.3, 0.6, 1],
//           positioning: SnapPositioning.relativeToAvailableSpace),
//       headerBuilder: (context, state) {
//         return Container(
//           height: SizeConfig.defaultHeight * 7,
//           width: double.infinity,
//           color: sheetColor,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.defaultWidth * 2,
//                 vertical: SizeConfig.defaultHeight),
//             child: Text(
//               "Today",
//               style: Theme.of(context).textTheme.headline6.copyWith(
//                   color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//       },
//       builder: (context, state) {
//         return Container(
//             color: sheetColor,
//             child: ListView.builder(
//               itemCount: transactions.length,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     ListTile(
//                       leading: Container(
//                         width: SizeConfig.defaultWidth * 6,
//                         height: SizeConfig.defaultWidth * 6,
//                         // color: Colors.white,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               transactions[index].color[400],
//                               transactions[index].color[700],
//                             ],
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             stops: [0.2, 1],
//                           ),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           transactions[index].icon,
//                           color: Colors.white,
//                           size: SizeConfig.defaultHeight * 3,
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               },
//             ));
//       }),
// );
