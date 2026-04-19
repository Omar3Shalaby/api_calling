# TV Shows API Calling App

A beautiful Flutter application that fetches and displays a list of TV shows using the [TVMaze API](https://www.tvmaze.com/api). This project serves as a comprehensive example of integrating REST APIs, implementing the MVC/MVVM architecture, and managing state with `Provider` in Flutter.

## 🚀 Features

*   **Browse Shows**: Displays a scrollable list of TV shows fetched directly from the internet.
*   **Comprehensive Details**: Click on any show card to view detailed information, including summary, rating, genres, and premiere date.
*   **Clean Architecture**: Scalable codebase organized neatly into Model, View, Controller, Service, and Provider directories.
*   **State Management**: Utilizes the `provider` package for efficient and responsive UI updates.
*   **Modern UI**: Features an elegant, card-based design with dynamic network image loading for a premium user experience.

## 📱 Screenshots

<p align="center">
  <img src="movies.jpeg" alt="App Screenshots" width="400"/>
</p>
<br>

## 🛠️ Tech Stack

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **State Management:** [Provider](https://pub.dev/packages/provider)
*   **Networking:** [HTTP](https://pub.dev/packages/http)
*   **API:** [TVMaze API](https://www.tvmaze.com/api)

## 📁 Project Structure

```text
lib/
├── Controller/      # Logic controllers (MovieController)
├── Model/           # Data definitions (MovieModel)
├── Provider/        # State managers (MovieProvider)
├── Service/         # API and external communications (MovieService)
├── View/            # UI screens (MovieScreen, MovieDetailScreen)
└── main.dart        # Entry point of the application
```

## ⚙️ Getting Started

Follow these steps to get the project up and running on your local machine.

### Prerequisites

*   Flutter SDK installed ([Setup Guide](https://docs.flutter.dev/get-started/install))
*   A supported IDE (VS Code, Android Studio, etc.)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/api_calling.git
    cd api_calling
    ```
2.  **Fetch dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the application:**
    ```bash
    flutter run
    ```

## 🤝 Contributing

Contributions, issues, and feature requests are always welcome!

---
*Built with ❤️ using Flutter*
