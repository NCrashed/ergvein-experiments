List<T> nullAppend<T>(T? value) {
  if (value == null) {
    return [];
  } else {
    return [value];
  }
}
