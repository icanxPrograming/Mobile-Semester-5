WAJIB : Jika di run di web wajib menggunakan port yang sama, karena web menggandalkan localstorage yang bergantung dengan domain yang sama.

Jika menggunakan emulator android atau device android secara langsung maka aman.

Gunakan contoh port di bawah ini jika menggunakan chrome:
flutter run -d chrome --web-port=5000

Jika menggunakan edge:
flutter run -d edge --web-port=5000