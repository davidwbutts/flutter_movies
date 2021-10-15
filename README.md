# Movies App
#### _Flutter playground app intended for experimentation_

Movies is a personal project intended to facilitate experimentation with various Flutter technologies.

## API Key (REQUIRED SETUP)
This app uses movie data from the [TMDB database](https://developers.themoviedb.org/3/getting-started/introduction).  
- To access the api, you must have an [API key](https://developers.themoviedb.org/3/getting-started/authentication).
- This api key will be read from a '.env' file, located in the projects root directory.
- Inside the file the key will be provided in key=value format (single line). Specifically: TMDB=<API_KEY>

IMPORTANT: To successfully query movie data, you MUST create this .env key file and add the necessary API key.  

## Tech Highlights
- Nav 2.0
- RestAPI using Retrofit backed by TMDB endpoints
- Sqlite db using Drift (formerly moor)

## TODOs
- store movies in database for offline use
- attribute TMDB as data source!!!  Thank you TMDB!
- network connectivity handling
- analytics / logging
- remote api pagination
- theme (sorry, no designer)
- testing...

## Tech

Open source packages include:
- [Flutter/Dart] - Awesome multi-platform framework/language
- [Provider] - navigation state management
- [Flutter Bloc] - content state management
- [GetIt] - Dependency Injection
- [Retrofit] - rest api package
- [Drift] - sqlite package.
- more...

## Screenshots
![popular movies](https://github.com/davidwbutts/flutter_movies/blob/main/screenshots/popular_list.png)
![kids movies](https://github.com/davidwbutts/flutter_movies/blob/main/screenshots/kids_list.png)
![movie details](https://github.com/davidwbutts/flutter_movies/blob/main/screenshots/movie_detail.png)


