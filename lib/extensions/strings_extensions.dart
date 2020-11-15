import 'package:websitegyd/models/route_data.dart';

extension StringExtensions on String {
  RouteData get getRoutingData {
    var uriData = Uri.parse(this);
    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RouteData(
        queryParameters: uriData.queryParameters, route: uriData.path);
  }
}
