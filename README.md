
# 🎓 Flutter Internship Searching App  

A mobile application built with Flutter that helps students discover and search for internship opportunities using the JSearch API via RapidAPI.

---

## 📱 Features  

- 🔍 Search internships by department, city, and keywords  
- 🏢 Department selection with dynamic filtering  
- 🌆 City input with validation and formatting  
- 🎨 Responsive UI with adaptive font sizes  
- 🌙 Light theme support with customizable colors  
- 📦 Modular code structure for easy scalability  

---

## 🧰 Technologies Used  

- **Flutter** (Dart)  
- **Material Design**  
- `http` package (for API integration)  
- `flutter_screenutil` (for responsive design)  
- `TextInputFormatter` (for input validation)  
- **JSearch API** via [RapidAPI](https://rapidapi.com/hub)  

---

## 🚀 Getting Started  

### Prerequisites  

- Flutter SDK installed  
- Android Studio or VS Code  
- Git  
- A valid **RapidAPI key** for [JSearch API](https://rapidapi.com/hub)  

### Installation  

```bash
git clone https://github.com/DoritosLover1/Flutter_Internship_Searching_App.git
cd Flutter_Internship_Searching_App
flutter pub get
````

---

## 🔑 API Configuration

Before running the app, you must add your RapidAPI key to the project:

1. Open `lib/App/IntershipApp.dart`
2. Replace the placeholder with your actual RapidAPI key:

```dart
'X-RapidAPI-Key': 'YOUR_API_KEY_HERE';
```

> ⚠️ **Important:** Without a valid API key, the app will not fetch internship data and may fail to compile or run properly.

---

## 🏗️ Build & Run

### Run on Emulator or Device

```bash
flutter run
```

### Build APK (Android)

```bash
flutter build apk --release
```

Output:

```
build/app/outputs/flutter-apk/app-release.apk
```

### Build App Bundle (Play Store)

```bash
flutter build appbundle
```

### Build for iOS (macOS required)

```bash
flutter build ios --release
```

> iOS builds require Xcode and an Apple Developer account.

---

## 🧪 Screenshots
<img width="1080" height="2400" alt="Screenshot_1755342879" src="https://github.com/user-attachments/assets/9315444c-e11c-4e53-a4c6-6e2b6e6e567f" />
<img width="1080" height="2400" alt="Screenshot_1755343009" src="https://github.com/user-attachments/assets/57a8dac0-dc91-4a31-a2b5-99dabbcf700f" />
<img width="1080" height="2400" alt="Screenshot_1755343018" src="https://github.com/user-attachments/assets/9e68777e-bfd4-457e-ade2-95c9b31b68b7" />

---

## 🛠️ Project Structure

```
lib/
├── main.dart
├── App/
│   └── IntershipApp.dart
├── SpecialWidgets/
│   └── SpecialWidgets.dart
├── SpecialClasses/
│   └── SpecialClasses.dart

```

---

## 🙋‍♂️ Author

**DoritosLover1**
GitHub: [@DoritosLover1](https://github.com/DoritosLover1)
