String toPascalCase(String input) {
  return input.split('_').map((word) => 
    word[0].toUpperCase() + word.substring(1).toLowerCase()
  ).join('');
}

String toSnakeCase(String input) {
  return input
    .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}')
    .toLowerCase()
    .replaceAll(RegExp(r'^_'), '');
}