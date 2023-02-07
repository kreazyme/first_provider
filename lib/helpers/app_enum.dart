enum LoadingStatus {
  loading,
  success,
  error,
  initial;

  bool get isLoading => this == LoadingStatus.loading;

  bool get isSuccess => this == LoadingStatus.success;

  bool get isError => this == LoadingStatus.error;

  bool get isInitial => this == LoadingStatus.initial;
}
