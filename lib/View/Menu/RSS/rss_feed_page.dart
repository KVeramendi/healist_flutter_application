import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/rss_feed_model.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class RSSFeedPage extends StatefulWidget {
  const RSSFeedPage({Key? key}) : super(key: key);

  @override
  State<RSSFeedPage> createState() => _RSSFeedPageState();
}

class _RSSFeedPageState extends State<RSSFeedPage> {
  late Future<List<RSSFeedModel>> dataFuture;
  final String _url = 'https://biotrendies.com/feed';

  @override
  void initState() {
    super.initState();
    dataFuture = getFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: dataFuture,
            builder: (context, AsyncSnapshot<List<RSSFeedModel>> snapshot) {
              if (!(snapshot.connectionState == ConnectionState.done)) {
                return const CircularProgressIndicator(
                    color: Color(0xFF1ECF6C));
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Center(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          final feedItem = snapshot.data![index];
                          return buildRSSFeedItems(feedItem);
                        },
                        itemCount: snapshot.data!.length),
                  ),
                );
              }
            }));
  }

  Widget buildRSSFeedItems(RSSFeedModel feedItem) => ListTile(
      leading: CachedNetworkImage(
          imageUrl: feedItem.imageUrl,
          placeholder: (context, url) =>
              Image.asset('assets/images/no_image.png'),
          width: 64.0,
          fit: BoxFit.cover),
      title: Text(feedItem.title,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 3),
      subtitle:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Wrap(spacing: 3.0, children: [
          const Icon(Icons.person_rounded, size: 16.0, color: Colors.grey),
          Text(feedItem.author, style: const TextStyle(fontSize: 12.0))
        ]),
        Wrap(spacing: 3.0, children: [
          const Icon(Icons.date_range_rounded, size: 16.0, color: Colors.grey),
          Text(feedItem.pubDate.toString().substring(0, 10),
              style: const TextStyle(fontSize: 12.0))
        ])
      ]),
      trailing: const Icon(Icons.keyboard_arrow_right,
          size: 28.0, color: Colors.grey),
      onTap: () => openFeed(feedItem.linkUrl));

  Future<List<String>> getAuthorAndImageData(String linkUrl) async {
    final responseImage = await http.get(Uri.parse(linkUrl));
    if (responseImage.statusCode != 200) {
      return throw 'Error en la solicitud HTTP del servidor. Código de error: ${responseImage.statusCode}';
    } else {
      var document = parse(responseImage.body);
      var author = document
          .getElementsByClassName('meta-bottom')[0]
          .children[0]
          .children[1];
      var image = document
          .getElementsByClassName('thumb-wrap')[0]
          .children[0]
          .children[0]
          .attributes['data-lazy-src'];
      return [author.text, image.toString()];
    }
  }

  Future<List<RSSFeedModel>> getFeed() async {
    final responseFeed = await http.get(Uri.parse(_url));
    if (responseFeed.statusCode != 200) {
      return throw 'Error en la solicitud HTTP del servidor. Código de error: ${responseFeed.statusCode}';
    } else {
      RssFeed? feed = RssFeed.parse(responseFeed.body);
      if (feed.items == null || feed.items!.isEmpty) {
        return throw 'Los items del feed estan vacíos o son nulos.';
      }
      final List<RSSFeedModel> _rssFeedItemList = [];
      for (int i = 0; i < feed.items!.length; i++) {
        final authorAndImageData =
            await getAuthorAndImageData(feed.items![i].link.toString());
        _rssFeedItemList.add(RSSFeedModel(
            feed.items![i].title.toString(),
            authorAndImageData[0],
            feed.items![i].pubDate,
            authorAndImageData[1],
            feed.items![i].link.toString()));
      }
      return _rssFeedItemList;
    }
  }

  Future<void> openFeed(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'No es posible abrir el enlace: $url';
    }
  }
}
