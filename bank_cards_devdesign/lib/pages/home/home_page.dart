import 'dart:math';

import 'package:bank_cards_devdesign/components/card/front_card.dart';
import 'package:bank_cards_devdesign/pages/detail/detail_page.dart';
import 'package:bank_cards_devdesign/pages/home/components/home_header.dart';
import 'package:bank_cards_devdesign/models/credit_card.dart';
import 'package:bank_cards_devdesign/pages/home/components/page_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../size_config.dart';
import 'components/balance.dart';

//4:50
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PageController pageController = PageController(viewportFraction: 0.6);
  PageNotifier _pageNotifier = PageNotifier();
  int _currentIndex = 0;
  int _previousIndex = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: SizeConfig.defaultHeight * 4,
        ),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => _pageNotifier,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildHeader()
              HomeHeader(),
              // _buildBalance(),
              Balance(
                  previousIndex: _previousIndex, currentIndex: _currentIndex),
              _buildCardsList(),
              _buildPageIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  // _buildHeader() =>
  //     Padding(
  //       padding: EdgeInsets.symmetric(
  //           horizontal: SizeConfig.defaultWidth * 2,
  //           vertical: SizeConfig.defaultHeight * 2
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text("Bank Cards", style: Theme
  //               .of(context)
  //               .textTheme
  //               .headline5
  //               .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
  //           ),
  //           CircleAvatar(radius: SizeConfig.defaultHeight * 2.5,
  //             child: Image.asset("assets/avatar.png"),),
  //         ],
  //       ),
  //     );

  // _buildBalance() => Container(
  //   width: double.infinity,
  //   child: Padding(
  //         padding: EdgeInsets.symmetric(
  //             horizontal: SizeConfig.defaultWidth * 2,
  //             vertical: SizeConfig.defaultHeight),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Balance",
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .bodyText2
  //                   .copyWith(color: Colors.white70),
  //             ),
  //             SizedBox(height: SizeConfig.defaultHeight),
  //             Row(
  //               children: [
  //                 Text(
  //                   "\$",
  //                   style: Theme.of(context).textTheme.headline6.copyWith(
  //                       fontWeight: FontWeight.bold, color: Colors.white),
  //                 ),
  //                 McCountingText(
  //                   begin: cards[_previousIndex].amount,
  //                   end: cards[_currentIndex].amount,
  //                   precision: 2,
  //                   style: Theme.of(context).textTheme.headline6.copyWith(
  //                       fontWeight: FontWeight.bold, color: Colors.white),
  //                 ),
  //               ],
  //             ),
  //             // Text(
  //             //   // "\$1231.21",
  //             //   "\$${cards[_currentIndex].amount}",
  //             //   style: Theme.of(context)
  //             //       .textTheme
  //             //       .headline6
  //             //       .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
  //             // )
  //           ],
  //         ),
  //       ),
  // );

  // _buildCardsList() => Container(
  //       child: FrontCard(
  //         card: cards[0],
  //       ),
  //     );

  _buildCardsList() => Expanded(
        child: Transform(
          transform: Matrix4.identity()
            ..translate(-SizeConfig.defaultWidth * 4)
            ..rotateZ(-pi / 2),
          alignment: Alignment.center,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: cards.length,
            controller: _pageNotifier.pageController,
            onPageChanged: (index) => setState(() {
              _previousIndex = _currentIndex;
              _currentIndex = index;
            }),
            itemBuilder: (context, index) {
              return Consumer<PageNotifier>(
                builder: (context, value, child) {
                  if (value.currentPage > index) {
                    double scaleFactor =
                        max(1 - (value.currentPage - index) * 0.4, 0.6);
                    double angleFactor =
                        min((value.currentPage - index) * 20, 20);
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..scale(scaleFactor)
                        ..rotateZ(-pi / 180 * angleFactor),
                      alignment: Alignment.center,
                      child: child,
                    );
                  }
                  return child;
                },
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(card: cards[index]))),
                  child: Container(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultHeight * 5),
                    child: FrontCard(
                      card: cards[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

  _buildPageIndicator() => Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultWidth * 2,
          vertical: SizeConfig.defaultHeight * 2),
      child: SmoothPageIndicator(
        controller: _pageNotifier.pageController,
        count: cards.length,
        effect: WormEffect(
          dotHeight: SizeConfig.defaultHeight,
          dotWidth: SizeConfig.defaultHeight,
          dotColor: Colors.grey[800],
          activeDotColor: Colors.white,
        ),
      ));
}
