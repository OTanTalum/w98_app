import 'package:w98app/models/location.dart';

class SearchResponse {
  List<Location>? locations = [];
  SearchResponse({
    this.locations,
  });

  factory SearchResponse.fromJson(List json) {
    return SearchResponse(
      locations:
          json.isNotEmpty ? json.map((i) => Location.fromJson(i)).toList() : [],
    );
  }

  // List<Map<String,dynamic>> toJson() {
  //   List<Map<String,dynamic>> data = [];
  //   if (locations != null) {
  //    locations!.forEach((Location v) => data+= v.toJson());
  //   }
  //   return data;
  // }
}
