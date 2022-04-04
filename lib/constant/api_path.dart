class ApiPath {
  ApiPath._();

  //Firebase API path
  static const String emergencynumber = "/emergency";
  static const String feature = "/feature";
  static const String report = "/report";
  static const String users = "/users";
  static const String banner = "/banner";

  static const String newsApiPath = 'https://newsapi.org/v2/top-headlines';
  static const String vaksinasiPath =
      'https://data.covid19.go.id/public/api/pemeriksaan-vaksinasi.json';

  static const String gempaBumiTerbaru =
      'https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json';
  static const String gempaBumiTerkini =
      'https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json';
  static const String daftarGempaBumi =
      'https://data.bmkg.go.id/DataMKG/TEWS/gempadirasakan.json';
}
