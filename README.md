[![Build Status](https://travis-ci.org/carayolthomas/randomUserApp.svg?branch=master)](https://travis-ci.org/carayolthomas/randomUserApp)[![codecov](https://codecov.io/gh/carayolthomas/randomUserApp/branch/master/graph/badge.svg)](https://codecov.io/gh/carayolthomas/randomUserApp)

## 👋 About
This app is the technical assessment as a iOS developer candidate at [Lydia app](https://lydia-app.com).

I had to build an app that fetch data from [randomuser.me]([https://api.randomuser.me](https://api.randomuser.me/)) API, display a paging list of retrieved users and finally show a details view about the selected user.
I also had to deal with connectivity issues.

## 🐍 Architecture
I decided to deal with this small app like it could be a big one. So I decided to use the [VIPER](https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6) architectural pattern.
This is a kind of Clean Architecture for iOS applications.

## 🛠 Dependencies
I tried to use as many dependencies as possible but I had to take shortcut sometimes to save some development time.
I use [CocoaPods](https://cocoapods.org) as dependency manager.
Here the list of the three dependencies I used :

- `Disk` to help me save and retrieve `Codable` struct into the app supporting files
- `SwiftEntryKit` to show error popup to the user without requiring user action to dimiss
- `Kingfisher` to load and process remote images

## 🕵️‍♂️ How to test 
Clone the project

git clone git@github.com:carayolthomas/randomUserApp.git

Install dependencies

sudo gem install cocoapods
pod install

Open `RandomUserApp.xcworkspace`

Build & Run 🔥

## 🎁 Licence
This app is released under the [MIT License](https://github.com/carayolthomas/randomUserApp/blob/master/LICENSE).
