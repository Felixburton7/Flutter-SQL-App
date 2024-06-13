# Flutter Supabase Simple CRUD App with Filtering

This project demonstrates a simple CRUD (Create, Read, Update, Delete) application with advanced filtering, built using Flutter and Supabase. It follows the MVVM (Model-View-ViewModel) pattern and Clean Architecture principles for maintainability, scalability, and testability.

## Features

- **CRUD Operations**: Create, Read, Update, and Delete records.
- **Filtering**: Search and filter records efficiently.
- **State Management**: Managed using Bloc.
- **Responsive UI**: User-friendly interface with consistent styling.

## Architecture

### MVVM Pattern

- **Model**: Manages data and business logic.
- **View**: Defines the UI and displays data.
- **ViewModel**: Handles UI logic and data binding.

### Clean Architecture

- **Separation of Concerns**: Divides the app into layers for easy management.
- **Testability**: Ensures each component can be tested independently.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/Felixburton7/Flutter-Supabase-Simple-CRUD-app-with-Filtering.git
   cd Flutter-Supabase-Simple-CRUD-app-with-Filtering
   ```

2. Install dependencies:
   ```sh
   flutter pub get
   ```

3. Set up Supabase:
   - Add your Supabase URL and anon key in `lib/core/secrets/secrets.dart`.

4. Run the app:
   ```sh
   flutter run
   ```

## Project Structure

- **lib/core**: Core functionalities and constants.
- **lib/data**: Data models and repositories.
- **lib/presentation**: UI components and state management.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License.

---

This README provides a concise overview of the project, its features, architecture, installation steps, and contribution guidelines.
