class ErrorReporter {
  static reportError(Object error, [StackTrace stacktrace]) {
    // TODO; report to Crashlytics
    print(error);
    print(stacktrace);
  }
}
