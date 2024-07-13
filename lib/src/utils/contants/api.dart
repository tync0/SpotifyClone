class ServiceConst {
  static final ServiceConst _instance = ServiceConst._createInstance();
  factory ServiceConst() {
    return _instance;
  }
  ServiceConst._createInstance();
  static const String baseUrl = 'http://172.20.88.71:8080';
  static const String loginEndPoint = '/login';
  static const String registerEndPoint = '/register';
  static const String getPlaylistsEndPoint = '/playlists';
  static const String getPlaylistById = '/playlist';
}
