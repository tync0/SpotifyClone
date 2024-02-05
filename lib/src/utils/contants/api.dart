class ServiceConst {
  static final ServiceConst _instance = ServiceConst._createInstance();
  factory ServiceConst() {
    return _instance;
  }
  ServiceConst._createInstance();
  static const String baseUrl = 'https://spotifyapi-xb00.onrender.com/api/v1/';
  static const String loginEndPoint = 'api-token-auth/';
  static const String registerEndPoint = 'users/';
  static const String playlistEndPoint = 'playlists/';
}
