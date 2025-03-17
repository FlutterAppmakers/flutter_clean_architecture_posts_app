# Flutter Posts App

This is a Flutter application that demonstrates the use of **Clean Architecture** to manage the structure of the app, separating concerns between different layers such as domain, data, and presentation.

## Project Structure

The project follows a Clean Architecture pattern, and the structure is divided into the following layers:

- **Domain Layer**: Contains the core business logic, including entities, use cases, and repositories.
- **Data Layer**: Implements the repositories and data sources for managing data (e.g., fetching posts from an API or a database).
- **Presentation Layer**: Contains all UI-related code, including pages and widgets.

## Commit Overview

### 1. Create post entity and post repository in domain layer
- **Created the Post entity**: The `Post` entity represents the core data structure in the app.
- **Created the Post Repository**: The repository in the domain layer defines the contract for fetching posts.

### 2. Finish posts repository and add all use cases in domain layer
- **Completed the Post Repository**: Implemented methods like fetching all posts, adding a post, and updating posts.
- **Added use cases**: Implemented use cases for managing posts, like fetching, adding, updating, and deleting posts.

### 3. Review on domain layer (entities, repositories, use cases)
- **Refined Domain Layer**: Improved the structure and design of entities, repositories, and use cases for better separation of concerns and scalability.

### 4. Write post model and start implementing posts repository in data layer
- **Post Model**: Added a `Post` model class in the data layer to map API responses to entities.
- **Started Implementing Repository**: Began implementing the repository methods in the data layer.

### 5. Finish posts repository implementation in data layer
- **Completed the Repository Implementation**: Finalized the methods for fetching, adding, updating, and deleting posts.

### 6. Finish data sources implementation in data layer
- **Implemented Data Sources**: Created and completed the data sources for fetching posts from an API, handling network calls.

### 7. Create Posts Page user interface in pages in presentation layer
- **Posts List Page**: Created the UI for displaying a list of posts, using the domain layer's use cases to fetch the data.

### 8. Create Post add update page in pages in presentation layer
- **Add/Update Post Page**: Designed and implemented a page for adding and updating posts, allowing users to input or modify content.

### 9. Create Post detail page in pages in presentation layer
- **Post Detail Page**: Created a detailed view of a single post, showing the full content and other related details.

## Architecture Overview

### Domain Layer
The domain layer contains the business logic and is independent of any external libraries, frameworks, or UI. It consists of:
- **Entities**: Pure data models representing the core business objects, such as `Post`.
- **Repositories**: Abstract classes that define the operations for interacting with data (e.g., `PostRepository`).
- **Use Cases**: Classes that represent specific actions or operations, such as fetching, adding, and updating posts.

### Data Layer
The data layer is responsible for implementing the repositories and interacting with external data sources (e.g., APIs, databases). It consists of:
- **Post Model**: A data model that maps API responses to the `Post` entity.
- **Repositories Implementation**: Concrete implementations of the repositories that fetch data from external sources.
- **Data Sources**: Classes responsible for handling different types of data sources (e.g., network calls, local storage).

### Presentation Layer
The presentation layer is responsible for displaying the UI. It consists of:
- **Pages**: UI screens that allow users to interact with the app, such as the posts list, add/update post, and post details.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/FlutterAppmakers/flutter_clean_architecture_posts_app.git

2. Navigate to the project directory:
 cd clean_architecture_posts_app

3. Install the dependencies:
flutter pub get

4.Run the app:
flutter run

## Features
View Posts: Display a list of posts.
Add Post: Add a new post with a title and body.
Edit Post: Update an existing post.
View Post Details: View the full details of a post.

Feel free to use, modify, and distribute this source code for personal or commercial purposes. There are no restrictions on usage.

