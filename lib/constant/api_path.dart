class ApiPath {
  ApiPath._();

  //Firebase API path
  static const String emergencyButton = "EmergencyHelp";
  static const String feature = "Features";
  static const String report = "Report";
  static const String reportDiscussion = "ReportDiscussion";
  static const String users = "Users";
  static const String banner = "banner";
  static const String reportCategory = "ReportCategory";
  static const String emergencyCall = "Emergency";
  static const String bookmarkReport = "Bookmarks";

  //Berita
  static const String newsApiPath = 'https://newsapi.org/v2/top-headlines';

  static const String postNotification =
      "https://onesignal.com/api/v1/notifications";

  //Gempa Bumi
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

  static const String feedbackUrl = "https://forms.gle/krTrsuRMFRsvS3GaA";
}
