//import 'package:caballo/config/config.dart';
//import 'package:caballo/helper_widgets/network_image.dart';
//import 'package:caballo/helper_widgets/photo_reviewer.dart';
//import 'package:caballo/utils/base_state.dart';
//import 'package:caballo/utils/color_utils.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/material.dart';
//
//class SliderBanner extends StatefulWidget {
//  final List<GalleryExampleItem> layoutData;
//  final int type;
//  final Function(int) tap;
//  static const TYPE_BANNER = 1;
//  static const TYPE_ALBUM = 2;
//
//  const SliderBanner({Key key, this.layoutData, @required this.type, @required this.tap}) : super(key: key);
//
//  @override
//  _SliderBannerState createState() => _SliderBannerState();
//}
//
//class _SliderBannerState extends BaseState<SliderBanner> {
//  int _lengthActive = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    if (widget.type == SliderBanner.TYPE_BANNER)
//      return slideBanner();
//    if (widget.type == SliderBanner.TYPE_ALBUM)
//      return slideAlbum();
//    return Container();
//  }
//
//  Widget slideAlbum() {
//    return Container(
//        color: Color(0xfff9f9f9),
//        width: double.infinity,
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
////            Container(
////                margin: EdgeInsets.only(top: (38), left: (17), right: (22)),
////                child: TitleBlock(layoutBlock: widget.layoutData)),
//            Container(
//              margin: EdgeInsets.only(top: 24),
//              child: CarouselSlider(
//                  viewportFraction: 0.664,
//                  aspectRatio: 350 / 288,
//                  items: widget.layoutData.map((i) {
//                    return _buildOnTapWrapper(
//                        Container(
//                          margin: EdgeInsets.symmetric(vertical: 9),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            mainAxisSize: MainAxisSize.min,
//                            children: <Widget>[
//                              ClipRRect(
//                                borderRadius: BorderRadius.circular(8),
//                                child: RemoteImage(
//                                  i.resource,
//                                  fit: BoxFit.contain,
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(left: 8),
//                                child: Text(
//                                  i.title ?? "",
//                                  maxLines: 1,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: Theme.of(context).textTheme.body1
//                                ),
//                              ),
//                              Container(
//                                height: 10,
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(left: 8),
//                                child: Text(
//                                  i.subtitle ?? "",
//                                  textAlign: TextAlign.start,
//                                  maxLines: 2,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: Theme.of(context).textTheme.caption
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                        i);
//                  }).toList()),
//            ),
//          ],
//        ));
//  }
//
//  Widget _buildOnTapWrapper(Widget child, GalleryExampleItem item) {
//    return GestureDetector(
//      onTap: () {
////        Navigator.push(
////            context,
////            MaterialPageRoute(
////                builder: (context) =>
////                    WebViewWidget(url: item.url, title: item.title)));
//          widget.tap(widget.layoutData.indexOf(item));
//      },
//      child: child,
//    );
//  }
//
//  Widget slideBanner() {
//    return Container(
////      height: MediaQuery.of(context).size.width / 2.5,
//      height: double.infinity,
//      width: double.infinity,
//      child: Stack(
//        children: <Widget>[
//          PageView(
//            physics: ClampingScrollPhysics(),
//            onPageChanged: (index) {
//              setState(() {
//                _lengthActive = index;
//              });
//            },
//            children: widget.layoutData.map((i) {
//              return _buildOnTapWrapper(
//                buildRemoteImage(i.resource, width: double.infinity, height: double.infinity),
////                  RemoteImage(
////                    i.resource,
////                    fit: BoxFit.contain,
////                  ),
//                  i);
//            }).toList(),
//          ),
//          Align(
//            alignment: Alignment.bottomCenter,
//            child: _buildDot(widget.layoutData.length),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _buildDot(int length) {
//    List<Widget> temp = List();
//    final space = Container(
//      height: 8,
//      width: 10,
//    );
//    for (int i = 0; i < length; i++) {
//      bool flat = _lengthActive == i ? true : false;
//      temp.add(Container(
//        child: Icon(
//          Icons.brightness_1,
//          color: flat ? Colors.white : Colors.black.withOpacity(0.1),
//          size: 8,
//        ),
//      ));
//      if (i <= length - 1) {
//        temp.add(space);
//      }
//    }
//    return Container(
//      margin: EdgeInsets.only(
//        bottom: 16,
//      ),
//      child: Row(
//        mainAxisSize: MainAxisSize.min,
//        children: temp,
//      ),
//    );
//  }
//}
