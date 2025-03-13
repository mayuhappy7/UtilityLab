class HttpClientSingleton {
  String? client;
  String? reverseProxyPath;
  static final HttpClientSingleton _singleton = HttpClientSingleton._internal();

  factory HttpClientSingleton() => _singleton;

  HttpClientSingleton._internal() {
    client = "192.168.185.4:9443";
    reverseProxyPath = "";
  }

  String buildUrl(String path) {
    return 'https://$client$reverseProxyPath$path';
  }
}
