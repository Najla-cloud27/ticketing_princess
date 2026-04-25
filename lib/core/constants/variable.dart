class Variable {
  static const String baseUrl = 'http://192.168.18.27:8000';
  // bikin end point untuk gambar
  static String imageBaseUrl(String? path) {
    // ngecek kalau path nya null atau kosong, return string kosong
    if (path == null || path.isEmpty) return '';
    // di cek apakah path diawali dengan / atau tidak
    // Kalau ada / nya, maka di ptong pakai substring ( 1 ) -> artinya ambil dari index 1 atau mulai dari
    // karakter 1
    final cleanPath = path.startsWith('/') ? path.substring(1) : path;
    return '$baseUrl/$cleanPath';
  }
}