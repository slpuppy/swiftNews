REALNEWS is a simple app that fetches Articles from Newsapi.org Api and presents a preview of them with the ability to filter the news by category

It uses a MVVM+C pattern and it was built upon SOLID principles and POP

Some features are: Filter by category of news, Pull to refresh update, Pagination.
Some technologies used: Concurrency(async await), XCTests, Compositional layout. 

This app was build for test and demostration purposes only

Troubleshooting errrors:

In case you start getting the error related to limit of api calls reached: 

1. Generate a new Api Key in newsapi.org
2. Open Xcode Project and click Edit Scheme on your selected target
3. Replace the envronment variable apiKey with your new key
4. Run the app


