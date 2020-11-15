class RouteData {
  final String route;
  final Map<String, String> _queryParameter;
  RouteData({this.route, Map<String, String> queryParameters})
      : _queryParameter = queryParameters;

  operator [](String key) => _queryParameter[key];
}
