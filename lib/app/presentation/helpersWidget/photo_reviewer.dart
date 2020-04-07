//
//import 'package:caballo/config/config.dart';
//import 'package:caballo/wigets/appbar_widget.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:photo_view/photo_view.dart';
//import 'package:photo_view/photo_view_gallery.dart';
//
//class GalleryPhotoViewWrapper extends StatefulWidget {
//  GalleryPhotoViewWrapper({
//    this.loadingChild,
//    this.backgroundDecoration,
//    this.minScale,
//    this.maxScale,
//    this.initialIndex,
//    @required this.galleryItems,
//    this.scrollDirection = Axis.horizontal,
//  }) : pageController = PageController(initialPage: initialIndex);
//
//  final Widget loadingChild;
//  final Decoration backgroundDecoration;
//  final dynamic minScale;
//  final dynamic maxScale;
//  final int initialIndex;
//  final PageController pageController;
//  final List<GalleryExampleItem> galleryItems;
//  final Axis scrollDirection;
//
//  static Future<dynamic> navigateToScreen(BuildContext context, List<GalleryExampleItem> galleryItems, int currentImage) {
//    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//      return GalleryPhotoViewWrapper(
//        galleryItems: galleryItems,
//        backgroundDecoration: const BoxDecoration(
//          color: ColorsConstants.primaryColor,
//        ),
//        initialIndex: currentImage,
//        scrollDirection: Axis.horizontal,
//      );
//    }));
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    return _GalleryPhotoViewWrapperState();
//  }
//}
//
//class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
//  int currentIndex;
//
//  @override
//  void initState() {
//    currentIndex = widget.initialIndex;
//    super.initState();
//  }
//
//  void onPageChanged(int index) {
//    setState(() {
//      currentIndex = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBarWidget(
//        titleToolbar: "Xem ảnh",
//        onBackClick: () {
//          Navigator.of(context).pop();
//        },
//      ),
//      body: Container(
//        decoration: widget.backgroundDecoration,
//        constraints: BoxConstraints.expand(
//          height: MediaQuery.of(context).size.height,
//        ),
//        child: Stack(
//          alignment: Alignment.bottomRight,
//          children: <Widget>[
//            PhotoViewGallery.builder(
//              scrollPhysics: const BouncingScrollPhysics(),
//              builder: _buildItem,
//              itemCount: widget.galleryItems.length,
//              loadingChild: widget.loadingChild,
//              backgroundDecoration: widget.backgroundDecoration,
//              pageController: widget.pageController,
//              onPageChanged: onPageChanged,
//              scrollDirection: widget.scrollDirection,
//            ),
//            Container(
//              padding: const EdgeInsets.all(20.0),
//              child: Text(
//                "Ảnh ${currentIndex + 1} / ${widget.galleryItems.length}",
//                style: const TextStyle(
//                  color: Colors.white,
//                  fontSize: 17.0,
//                  decoration: null,
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
//    final GalleryExampleItem item = widget.galleryItems[index];
//    return item.isSvg
//        ? PhotoViewGalleryPageOptions.customChild(
//      child: Container(
//        width: 300,
//        height: 300,
//        child: SvgPicture.asset(
//          item.resource,
//          height: 200.0,
//        ),
//      ),
//      childSize: const Size(300, 300),
//      initialScale: PhotoViewComputedScale.contained,
//      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
//      maxScale: PhotoViewComputedScale.covered * 1.1,
//      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
//    )
//        : PhotoViewGalleryPageOptions(
//      imageProvider: item.isNetWorkImage ?  NetworkImage(item.resource): AssetImage(item.resource),
//      initialScale: PhotoViewComputedScale.contained,
//      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
//      maxScale: PhotoViewComputedScale.covered * 1.1,
//      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
//    );
//  }
//}
//
//
//class GalleryExampleItem {
//  GalleryExampleItem({this.id, this.resource, this.isSvg = false, this.isNetWorkImage = true, this.title, this.subtitle});
//
//  final String title;
//  final String subtitle;
//  final String id;
//  final String resource;
//  final bool isSvg;
//  final bool isNetWorkImage;
//}
//
//class GalleryExampleItemThumbnail extends StatelessWidget {
//  const GalleryExampleItemThumbnail(
//      {Key key, this.galleryExampleItem, this.onTap})
//      : super(key: key);
//
//  final GalleryExampleItem galleryExampleItem;
//
//  final GestureTapCallback onTap;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.symmetric(horizontal: 5.0),
//      child: GestureDetector(
//        onTap: onTap,
//        child: Hero(
//          tag: galleryExampleItem.id,
//          child: galleryExampleItem.isNetWorkImage ? Image(image: NetworkImage(galleryExampleItem.resource),) : Image.asset(galleryExampleItem.resource, height: 80.0),
//        ),
//      ),
//    );
//  }
//}