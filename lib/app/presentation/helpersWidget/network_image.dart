import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class RemoteImage extends StatefulWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius borderRadius;

  RemoteImage(this.url,
      {this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.borderRadius = BorderRadius.zero,
      this.alignment = Alignment.center});

  @override
  _RemoteImageState createState() => _RemoteImageState();
}

class _RemoteImageState extends State<RemoteImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Image(
        alignment: widget.alignment,
        image: AdvancedNetworkImage(widget.url,
            useDiskCache: true,
            cacheRule: CacheRule(storeDirectory: StoreDirectoryType.document)),
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
      ),
    );
  }
}
