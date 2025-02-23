# 🚗 Vehicle App

A Flutter app to display a list of vehicles based on their fuel efficiency and age. Vehicles are categorized by pollution level using color codes.

## 📌 Features
- Add and display vehicles with name, fuel efficiency, and age.
- Categorize vehicles with **Green, Amber, and Red** colors:
  - 🟢 **Green**: Fuel-efficient (≥15 km/l) & age ≤5 years.
  - 🟠 **Amber**: Fuel-efficient (≥15 km/l) but age >5 years.
  - 🔴 **Red**: Not fuel-efficient (<15 km/l).
- Data is stored and retrieved using **Firebase Firestore**.
- Implements **BLoC State Management** for efficiency.

## 🛠️ Tech Stack
- **Flutter & Dart** 🐦
- **Firebase Firestore** 🔥
- **BLoC State Management** 🎯
- **fpdart** (Functional Programming)
- **get_it** (Dependency Injection) 

## 🚀 Getting Started
1. Clone the repo:
   ```sh
   git clone https://github.com/yourusername/vehicle-app.git

2. Install dependencies:
    ```sh
    flutter pub get

3. Run the app:
    ```sh
    flutter run

## 🎯 Conclusion

The Vehicle App is a simple yet efficient Flutter application that categorizes vehicles based on fuel efficiency and age. It leverages Firebase Firestore for data storage and BLoC for state management, ensuring smooth performance. 🚀
