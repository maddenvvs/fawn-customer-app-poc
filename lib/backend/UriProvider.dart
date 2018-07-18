import 'package:meta/meta.dart';

class UriProvider {
  final Uri baseUri;
  final Uri goodsEndpoint;
  final Uri ordersEndpoint;

  UriProvider(
    this.baseUri,
  )   : assert(baseUri != null),
        goodsEndpoint = Uri(
          scheme: baseUri.scheme,
          host: baseUri.host,
          port: baseUri.port,
          path: "/api/v201807/Goods",
        ),
        ordersEndpoint = Uri(
          scheme: baseUri.scheme,
          host: baseUri.host,
          port: baseUri.port,
          path: "/api/v201807/Orders/",
        );

  UriProvider.forOrigin(
    String originUrl,
  ) : this(Uri.parse(
          originUrl,
        ));

  Uri goodsUri({
    String id,
  }) {
    if (id == null) return goodsEndpoint;

    return goodsEndpoint.resolve(id);
  }

  Uri ordersUri({
    String id,
  }) {
    if (id == null) return ordersEndpoint;

    return ordersEndpoint.resolve(id);
  }

  Uri orderStatusUri({
    String id,
  }) {
    if (id == null) return ordersEndpoint;

    return ordersEndpoint.resolve("$id/Status");
  }

  Uri cancelOrderByIdUri({
    @required String id,
  }) {
    assert(id != null);

    return ordersEndpoint.resolve("$id/Cancel");
  }
}
