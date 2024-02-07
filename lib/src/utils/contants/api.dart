class ServiceConst {
  static final ServiceConst _instance = ServiceConst._createInstance();
  factory ServiceConst() {
    return _instance;
  }
  ServiceConst._createInstance();
  static const String baseUrl = 'https://spotifyapi-xb00.onrender.com/';
  static const String loginEndPoint = 'api-token-auth/';
  static const String registerEndPoint = 'api/v1/users/';
  static const String playlistEndPoint = 'api/v1/playlists/';
}
