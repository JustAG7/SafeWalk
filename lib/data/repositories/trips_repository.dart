import '../models/route_option.dart';
import '../models/trip.dart';

abstract class TripsRepository {
  Future<List<Trip>> fetchTrips(String userId);
  Future<void> saveTrip(Trip trip);
  Future<List<RouteOption>> fetchRouteOptions(String tripId);
  Future<void> saveRouteOption(RouteOption routeOption);
}

