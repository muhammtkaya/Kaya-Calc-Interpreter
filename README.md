# Lex & Yacc Based Calculator Interpreter

This repository contains the implementation of a functional calculator interpreter using Lex (Flex) for lexical analysis and Yacc (Bison) for parsing. Developed for the TOBB ETÜ BİL395 - Assignment 1, this project demonstrates the principles of tokenization, grammar definition, and basic expression evaluation.

---

## 📋 Features & Specifications

The interpreter is designed to handle arithmetic expressions and variable management based on the following specifications:

### 1. Supported Operations
* **Basic Arithmetic:** Addition (+), Subtraction (-), Multiplication (*), and Division (/).
* **Exponentiation:** Support for both ^ and ** operators using the pow() function.
* **Parentheses:** Handles nested expressions to manage operator precedence.
* **Unary Minus:** Correct evaluation of negative numbers using %prec UMINUS.

### 2. Technical Implementation Details
* **Floating-Point Support:** The lexer utilizes atof() to process integers and decimal numbers as double values.
* **Variables & Assignments:** Supports 26 lowercase variables (a-z). Values can be stored using the = operator (e.g., x = 5.5).
* **Error Handling:** Reports "Division by zero" errors, detects syntax errors via yyerror, and identifies undefined characters.

---

## 🛠 Project Structure

* **calculator.l:** Lex specification file for tokenizing numbers, operators, and variables.
* **calculator.y:** Yacc grammar file defining expression rules and evaluation actions.

---

## 🚀 How to Run

Use the following commands to compile and execute the interpreter:

### 1. Generate Source Files
lex calculator.l
yacc -d calculator.y

### 2. Compile with GCC
gcc lex.yy.c y.tab.c -o calculator -lm

### 3. Run the Program
./calculator

---

## 🧪 Test Cases

The following scenarios have been tested to ensure compliance:
1. **Simple Arithmetic:** 3 + 5 * 4 (Result: 23.000)
2. **Floating-Point:** 10.5 / 2.1 (Result: 5.000)
3. **Exponentiation:** 2^3 or 2**3 (Result: 8.000)
4. **Variable Assignment:** a = 5.5; b = a * 2 (Result: 11.000)
5. **Complex Expressions:** (3 + 5) * (2 - 1) / 4 (Result: 2.000)
6. **Error Reporting:** 10 / 0 (Reports: "Sıfıra bölme isteği geçersiz")

---

## 🎓 Academic Context
This project was developed for the TOBB ETÜ Computer Engineering Department. It fulfills the requirements for the BİL395 - Assignment 1 regarding interpreter implementation for arithmetic and assignment operations.
