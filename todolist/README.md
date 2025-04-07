# Todolist

A simple Todolist project in Flutter.

## Concepts learn

### 1. **State Management**

- `setState()` for local state changes
- Immutable state patterns (creating new objects instead of mutating)
- Lifting state up to parent widgets

### 2. **Widget Composition**

- Building custom widgets (`smallButton`)
- Reusing components across the app
- Conditional rendering (edit vs view modes)

### 3. **List Operations**

- Spread operator (`...`) for immutable updates
- `sublist()` for partial list operations
- Index-based state updates

### 4. **Forms & Input Handling**

- `TextEditingController` management
- Input validation (empty checks + trimming)
- Form submission handling (`onSubmitted`)

### 5. **UI/UX Principles**

- Scroll behavior (`SingleChildScrollView` + `NeverScrollableScrollPhysics`)
- Overflow prevention techniques
- Dense layouts with `isDense` and custom padding

### 6. **Layout Systems**

- `Row` and `Column` nesting
- `Expanded` widget for flexible space
- Padding/margin management

### 7. **Lifecycle & Performance**

- `shrinkWrap` for optimized lists
- Controller disposal (implicit via widget lifecycle)
- Efficient rebuilds with immutable state

### 8. **Dart Language Features**

- Final vs var variables
- Constructor initializers
- Conditional expressions (ternary operator)
- Spread operator for collections

### 9. **App Architecture**

- Separation of data model (`Todo` class) and UI
- Stateless vs Stateful widget distinction
- Business logic organization

### 10. **Common Patterns**

- CRUD operations (Create, Read, Update, Delete)
- Toggle pattern (`isDone = !isDone`)
- Index-based state tracking (`editIndex`)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
