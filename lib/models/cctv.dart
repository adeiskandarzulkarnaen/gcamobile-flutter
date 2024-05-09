
class Cctv {
  final String name;
  final String location;
  final String latitude;
  final String longitude;
  final String thumbnail;
  final String linkRtmp;

  Cctv({
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.thumbnail,
    required this.linkRtmp,
  });

  factory Cctv.fromJson(Map<String, dynamic> json) {
    return Cctv(
      name: json["nama_cctv"],
      location: json["lokasi_cctv"],
      latitude: json["lat"],
      longitude: json["lng"],
      thumbnail: json["thumbnail"],
      linkRtmp: json["link_rtmp"],
    );
  }
}