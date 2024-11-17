# **Currency Converter App**

## **Setup Instructions**

## **1. Prerequisites**
Must have git, Flutter SDK, android studio installed on your system.

Configure following android toolchain using android studio.

(Android SDK Platform, API 35.0.1,
Android SDK Command-line Tools,
Android SDK Build-Tools,
Android SDK Platform-Tools,
Android Emulator)

An IDE such as VS Code with the Flutter and Dart plugins installed.

### **2. Clone the Repository**
```bash
git clone https://github.com/owinog/currencyconvapp.git
cd currency-converter
```
### **3. Install Dependencies**
run
```bash
flutter pub get
```
### **4. Run the app**
run
```bash
flutter run
```

## **Architecture**
### **MVVM (Model-View-ViewModel)**
The MVVM architecture was chosen for its balance between simplicity and scalability:

Model: Handles data management, including API calls and local storage.

View: Displays the user interface and listens for user interactions.

ViewModel: Acts as a bridge between the View and Model, managing application logic and state.

### **Advantages:**

Cleanly separates UI, business logic, and data handling.

Easier to add new features or refactor without affecting other layers.

Uses ChangeNotifier for lightweight and efficient state management.
