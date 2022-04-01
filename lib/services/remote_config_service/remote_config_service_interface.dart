abstract class RemoteConfigServiceInterface {
  ///Gets the value for a given key as a map
  Future<Map<String, dynamic>> getJson(String key);

  /// Gets the value for a given key as a bool.
  Future<bool> getBool(String key);

  /// Gets the value for a given key as an int.
  Future<int> getInt(String key);

  /// Gets the value for a given key as a double.
  Future<double> getDouble(String key);

  /// Gets the value for a given key as a String.
  Future<String> getString(String key);

  /// Check and validate cache to fetch new remote config
  Future<void> validateCache();

  /// Reset and invalidate cache to fetch new remote config
  Future<void> invalidateCache();
}
