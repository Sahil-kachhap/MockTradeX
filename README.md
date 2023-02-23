# mock_tradex

A new Flutter project.

## App Screens

### Graph Screen
<img src="https://user-images.githubusercontent.com/54017876/220966746-329e1bd9-7087-4059-b653-164f600477c7.jpg" width="200" height="400" />

### Exchange Screen
<img src="https://user-images.githubusercontent.com/54017876/220969052-28ae4e29-7b48-4e86-926f-320f94f1ee03.jpg" width="200" height="400" />

### News
<img src="https://user-images.githubusercontent.com/54017876/220969994-2be2dcdb-bc3f-4467-9e4e-e60bc1ad86d8.jpg" width="200" height="400" />

### Trade
<img src="https://user-images.githubusercontent.com/54017876/220970522-f8024010-85a1-4d74-934f-948379847f16.jpg" width="200" height="400" />

### Index
<img src="https://user-images.githubusercontent.com/54017876/220971042-29998ac5-ebdb-4a0d-8c48-154164da3feb.jpg" width="200" height="400" />

### Login
<img src="https://user-images.githubusercontent.com/54017876/220971370-d0fe5020-08a7-4cbc-b2a2-814b860ff9e8.jpg" width="200" height="400" />

## Get Your Copy 

- Fork this repo
- Clone the repo

## Getting Started

### Understanding the lib folder:

1. Presentation Folder -> this folder will contain all the code for screen UI (in Presentation/Screen Folder) and some common widgets (under Presentation/Widgets Folder).

2. Buisness_Logic Folder -> This Folder will have all the logical components of our application. BLOC will be used for state management purpose.

3. Data Folder -> This Folder contains Data_Provider, Models and Repositories as subFolder.
  
  - Data_Provider encapsulates all the source files from where data needs to be fetched like an API, or from Database

  - Repositories transforms the data fetched by Data_Provider into a model using the Models made in Model Folder.

## WorkFlow

- Presentation Layer asks for any sort of Data From Buisness_Logic Layer which in turn Send this request to Data Layer

- Here, Under Data layer Repositories Folder models the data fetched by data_provider layer and sends back to Buisness_logic layer which is returned to Presentation Layer which then gets rendered on the screen.

## Local Clone Setup

- After Cloning this repo into your local system
- Create a branch from master and switch into it - git checkout -b your-name/feature-name (eg: git checkout -b sahil/building_HomeScreen)
- it needs to be kept in your mind no code should be commited on the master branch.
- do your work in your feature branch.
- once done, add all changes using this command --> git add .
- then run: git commit -m "short description of your work"
- git push origin master
- Create a PR

