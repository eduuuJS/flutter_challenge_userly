enum ENV {
  dev,
  qa,
  prod,
}

extension Environment on ENV {
  static ENV type = ENV.dev;
  static Map<String, dynamic> get appConfig {
    switch (type) {
      case ENV.dev:
        return {
          "enviroment": "DESAROLLO",
          "baseUrl": "https://jsonplaceholder.typicode.com",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
          "sendTimeout": 600000,
        };
      case ENV.qa:
        return {
          "enviroment": "QA",
          "baseUrl": "",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
        };
      case ENV.prod:
        return {
          "enviroment": "PRODUCCIÓN",
          "baseUrl": "",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
        };
      default:
        return {
          "": "",
        };
    }
  }
}
