# FoodTruck Mobile App 🍔🚚

Welcome to FoodTruck, a Flutter-based mobile application that helps users find food trucks from anywhere in San Francisco. The app utilizes location services and sophisticated search functionality to provide users with a convenient way to discover and explore food options on the go.

## Installation and Setup

To get started with FoodTruck Mobile App, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
3. Run `flutter pub get` to install dependencies.
4. Ensure you have an emulator or a physical device connected.
5. Run `flutter run` to launch the application.

## Pages and Navigation

### Splash Screen
- Displays the app logo and name upon launch.
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/29a1d2a3-1cdd-454d-8ebb-de33d64a909a" alt="splash" width="200">

### Location Permission Request
- Requests permission from the user to access their device's location.
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/5daeb176-92dc-44d9-9a44-cf9d997f60a0" alt="show_ask_permission" width="300">
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/555d022b-9a0e-4c84-9013-91ce6b54d5aa" alt="show_location_warning" width="300">

### Home Page
- The main screen of the app where users can search for food trucks and set filters.
- Includes a radius picker, search bar, toggle button for availability, filter selector, and location button.
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/e6807cfe-0a51-436c-af90-a7350ce59c2d" alt="show_home" width="300">
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/d467942a-9779-4c6f-b9e1-53f8517b861f" alt="availabe_search" width="300">
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/418c3590-2179-4237-a996-438486341a2a" alt="adress_key_word_search" width="300">
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/638b944f-0593-4453-a38f-7c3c7d2a990a" alt="show_radius_filter" width="300">
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/e383f414-dba3-4081-90a4-1d7b383c9d9f" alt="filter_by_facility" width="300">

### Food Detail Screen
- Displays detailed information about a selected food truck, including name, cuisine type, working hours, and food items served.
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/406cee4c-e89b-4ab7-a10d-eca7810709ce" alt="show_detail_page" width="300">
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/6670609d-1a3f-4f3a-818f-12804eabbba3" alt="show_working_hours" width="300">

### Bottom Sheet for Available Foods
- Appears when the "Food" button is tapped on the Home Page.
- Shows all available food items in a bottom sheet.
- When a food item is selected, it displays restaurants that serve that specific food.
<img src="https://github.com/Natnael16/food-truck-mobile/assets/91603089/2bc62507-58a9-4a82-b310-95fbd1e2752f" alt="food_items" width="300">

## Third-Party Libraries

FoodTruck Mobile App utilizes the following third-party packages:

- `dio`: A powerful HTTP client for making network requests.
- `google_maps_flutter`: Provides Google Maps integration for displaying maps and location services.


**Future Enhancements**

- **Chatbot Integration:** Introduce a chatbot to provide interactive guidance and personalized recommendations.
- **Authentication:** Implement user authentication for features like ratings, favorites, and friend sharing.
- **Ratings and Favorites:** Allow users to rate food trucks and mark favorites for a more curated experience.
- **Social Sharing:** Facilitate effortless sharing of food truck discoveries with friends and family.
Feel free to reach out for any assistance or feedback. Happy food truck hunting!
