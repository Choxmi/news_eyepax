
# News App

Sample news application


<img src="http://satlabs.site/eyepax/logo.png" width="70" height="70" alt="Logo">


## Installation

Install news_eyepax on your device

```bash
  cd news_eyepax
  flutter pub get
  flutter run
```
    
## Screenshots

<img src="http://satlabs.site/eyepax/screen1.png" width="70" height="145" alt="Screen1">
<img src="http://satlabs.site/eyepax/screen2.png" width="70" height="145" alt="Screen2">
<img src="http://satlabs.site/eyepax/screen3.png" width="70" height="145" alt="Screen3">
<img src="http://satlabs.site/eyepax/screen4.png" width="70" height="145" alt="Screen4">
<img src="http://satlabs.site/eyepax/screen5.png" width="70" height="145" alt="Screen5">
<img src="http://satlabs.site/eyepax/screen6.png" width="70" height="145" alt="Screen6">
<img src="http://satlabs.site/eyepax/screen7.png" width="70" height="145" alt="Screen7">


## Usage

Application has six main screens.

- Login
  - Login screen for `news_eyepax` application. User can enter credentials and login or navigate to registration screen.
- Registration
  - User can self register entering name, username and password. Once registered, user will be redirected to the login screen.
- Dashboard
  - Dashboard contains a search bar and a profile button on the top. User can use the search button to navigate to the search screen. Profile button can be used to logout from the application.
  - Breaking news contains view all option which navigates user to to the breaking news list page, sliding tiles with breaking news content and a filtr bar to filter breaking news by category.
  - Top news items are at the bottom of the dashboard. User can click on the tiles to navigate to the relavant news details screen.
- Breaking News
  - List of breaking news components. User can tap on a component to view details about the news.
- Search
  - Shows a paginated list generated according to the query entered. News list get updated on search text change. User can filter news by language as well.
- News details
  News details page with news image, title and content



## Demo
[Demo](http://satlabs.site/eyepax/demo.gif)
## Appendix

Application uses [NewsAPI](https://newsapi.org/) to fetch news data.

