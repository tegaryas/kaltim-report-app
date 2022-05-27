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

  //Rumah Sakit
  static const String rumahSakitBaseUrl =
      'https://rs-bed-covid-api.vercel.app/api';
  static const String getRSprovince = '/get-provinces';
  static const String getRScities = '/get-cities';

  //Vaksin
  static const String vaksin =
      'https://vaksincovid19-api.vercel.app/api/vaksin';
}
