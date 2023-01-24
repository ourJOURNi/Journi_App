class ErrorGettingPrograms implements Exception {
  ErrorGettingPrograms(String error);
}
class ErrorGettingProfiles implements Exception {
  ErrorGettingProfiles(String error);
}

class ErrorEmptyResponse implements Exception {}