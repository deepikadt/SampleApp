List<String> calculatePrime(double n) {
  List<String> primefactorList = [];
  for (int i = 2; i <= n; i++) {
    if (checkPrime(i)) primefactorList.add(i.toString());
  }
  return primefactorList;
}

bool checkPrime(int n) {
  if (n <= 1) return false;
  for (int i = 2; i < n; i++) if (n % i == 0) return false;
  return true;
}
