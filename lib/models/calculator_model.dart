import 'dart:math';
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

  // Función 1: Módulo (Residuo de la división)
  // Funciona igual que la división, requiere dos números
  double modulo(double num1, double num2) {
    if (num2 == 0) return 0; // Evitar división por cero
    return num1 % num2;
  }

  // Función 2: Al Cuadrado
  // Esta función solo necesita UN número
  double cuadrado(double num1) {
    return num1 * num1; // También podrías usar pow(num1, 2)
  }

  // Función 3: Raíz Cuadrada
  //Esta necesita solo UN número y usa la librería 'dart:math'
  double raizCuadrada(double num1) {
    if (num1 < 0) return 0; // Para evitar errores con raíces negativas
    return sqrt(num1);
  }
}