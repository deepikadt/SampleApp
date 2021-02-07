import 'dart:math' as math;

List<String> calculatePrime(double n) {
  List<String> primefactorList = [];

  while (n % 2 == 0) {
    primefactorList.add("2");
    n /= 2;
  }

  for (int i = 3; i <= math.sqrt(n); i += 2) {
    while (n % i == 0) {
      primefactorList.add(i.truncate().toString());
      n /= i;
    }
  }

  if (n > 2) primefactorList.add(n.truncate().toString());

  return primefactorList;
}
