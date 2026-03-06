/// Modelo que contiene las operaciones básicas de una calculadora
class Calculator {
  /// Suma dos números
  double sumar(double a, double b) {
    return a + b;
  }

  /// Resta dos números
  double restar(double a, double b) {
    return a - b;
  }

  /// Multiplica dos números
  double multiplicar(double a, double b) {
    return a * b;
  }

  /// Divide dos números
  /// Lanza una excepción si el divisor es cero
  double dividir(double a, double b) {
    if (b == 0) {
      throw Exception('No se puede dividir entre cero');
    }
    return a / b;
  }
}