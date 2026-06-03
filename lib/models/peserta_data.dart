class PesertaData {
  const PesertaData({
    required this.nama,
    required this.nbi,
    required this.email,
    required this.alamat,
    required this.instagram,
  });

  final String nama;
  final String nbi;
  final String email;
  final String alamat;
  final String instagram;
}

class PesertaDataStore {
  static PesertaData? current;
}
