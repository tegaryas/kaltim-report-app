import 'dart:convert';

Map<String, dynamic> remoteConfigDefaultValue = {
  "feature_covid": jsonEncode({
    "features": [
      {
        "type": "covid",
        "image":
            "https://dinkes.acehprov.go.id/uploads/Ilustrasi_Vaksinasi1.jpg",
        "title": "Data Covid 19",
        "subtitle": "Cek perkembangan jumlah kasus Covid-19",
        "path": "covid-data",
        "route": "CovidDataRoute"
      },
      {
        "type": "vaksin",
        "image":
            "https://dinkes.acehprov.go.id/uploads/Ilustrasi_Vaksinasi1.jpg",
        "title": "Data Vaksinasi",
        "subtitle": "Cek Dashboard Cakupan Vaksinasi Wilayah",
        "path": "vaksin-data",
        "route": "VaksinDataRoute"
      },
      {
        "type": "rumah_sakit",
        "image":
            "https://dinkes.acehprov.go.id/uploads/Ilustrasi_Vaksinasi1.jpg",
        "title": "Data Rumah Sakit",
        "subtitle": "Lihat ketersediaan tempat tidur untuk pasien Covid-19",
        "path": "rumah-sakit",
        "route": "RumahSakitRoute"
      }
    ]
  }),
};
