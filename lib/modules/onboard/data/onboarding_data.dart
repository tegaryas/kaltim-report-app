class OnboardingData {
  final String imageAssets;
  final String title;
  final String subtitle;

  OnboardingData({
    required this.imageAssets,
    required this.title,
    required this.subtitle,
  });
}

List<OnboardingData> data = [
  OnboardingData(
    imageAssets: "assets/images/onboarding_slide1.png",
    title: 'Aplikasi Siap Sedia Untukmu',
    subtitle: "Bisa akses banyak fitur yang mendukung keseharianmu",
  ),
  OnboardingData(
    imageAssets: "assets/images/onboarding_slide2.png",
    title: 'Deteksi & Laporkan Daerah Rawan',
    subtitle:
        "Laporanmu akan dilihat oleh semua warga didaerahmu secara langsung",
  ),
  OnboardingData(
    imageAssets: "assets/images/onboarding_slide3.png",
    title: 'Panggilan & Daftar Telpon Darurat',
    subtitle:
        "Kamu hanya tinggal menekan tombol panggil dan kami akan melayani keluhanmu",
  )
];
