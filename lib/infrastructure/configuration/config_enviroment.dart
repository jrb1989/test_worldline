
import 'enviroments.dart';

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.local;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.local,
      'url': 'http://localhost:8080/api/',
    },
    {
      'env': Environments.dev,
      'url': '',
    },
    {
      'env': Environments.production,
      'url': '',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
