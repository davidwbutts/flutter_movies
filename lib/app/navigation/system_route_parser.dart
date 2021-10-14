
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SystemRouteParser extends RouteInformationParser<String> {
  const SystemRouteParser() : super();

  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(routeInformation.location ?? '');
}