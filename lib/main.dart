import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H.B.D to you',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();

  final List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
    /// `Add here new photos like below`

    /// ` GalleryExampleItem(     `
    /// `   id: "tag1",            <- This is for hero tag     `
    /// `   imageUrl: "assets/gallery1.jpg",           <- This is where you put the path of your asset photo     `
    /// ` ),     `
    /// ` GalleryExampleItem(     `
    /// `   id: "tag3",     `
    /// `   imageUrl: "assets/gallery2.jpg",     `
    /// ` ),     `
    /// ` GalleryExampleItem(     `
    /// `   id: "tag4",     `
    /// `   imageUrl: "assets/gallery3.jpg",     `
    /// ` ),`
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("H.B.D to you"),
      ),
      body: Container(
        child: PhotoViewGallery.builder(
          scrollDirection: Axis.vertical,
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              /// `If the photos will be from internet, you'll change the *AssetImage* to *NetworkImage*`

              imageProvider: AssetImage(
                galleryItems[index].imageUrl,
              ),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(
                tag: galleryItems[index].id,
              ),
            );
          },
          itemCount: galleryItems.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
          pageController: pageController,
        ),
      ),
    );
  }
}

class GalleryExampleItem {
  GalleryExampleItem({this.id, this.imageUrl});

  final String id;
  final String imageUrl;
}
