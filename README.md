# 📸 photobooth_mini

**photobooth_mini** là một ứng dụng chụp ảnh đơn giản được xây dựng bằng Flutter, mô phỏng trải nghiệm photobooth với các tính năng chụp nhanh, xem lại ảnh và xử lý ảnh cơ bản.

---

## 🚀 Tính năng chính

* 📷 Chụp ảnh nhanh bằng camera
* 🖼️ Xem lại ảnh đã chụp
* 🎨 Áp dụng filter / hiệu ứng đơn giản (nếu có)
* 💾 Lưu ảnh vào thiết bị
* 📱 Giao diện thân thiện, tối ưu cho mobile

---

## 🛠️ Công nghệ sử dụng

* **Flutter** – Framework phát triển ứng dụng đa nền tảng
* **Dart** – Ngôn ngữ lập trình chính
* (Tùy chọn thêm nếu bạn dùng)

  * camera package
  * image_picker
  * path_provider

---

## 📂 Cấu trúc dự án

```bash
lib/
 ├── main.dart          # Entry point
 ├── screens/           # Các màn hình
 ├── widgets/           # Component tái sử dụng
 └── services/          # Xử lý logic (camera, lưu ảnh,...)
```

---

## ▶️ Cách chạy project

### 1. Cài đặt Flutter

Đảm bảo bạn đã cài Flutter và cấu hình PATH.

```bash
flutter doctor
```

### 2. Cài dependencies

```bash
flutter pub get
```

### 3. Chạy ứng dụng

```bash
flutter run
```

---

## 📦 Build APK

```bash
flutter build apk
```

---

## 📌 Ghi chú

* Ứng dụng yêu cầu quyền truy cập **Camera** và **Storage**
* Khuyến nghị chạy trên thiết bị thật để test camera

---

## 📖 Tài liệu tham khảo

* https://docs.flutter.dev/
* https://pub.dev/

---

## 👨‍💻 Tác giả

* godhitech
