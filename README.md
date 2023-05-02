# NY Most Viewed Popular Articles
## Getting Started

### NY Most Viewed Popular Articles project, with following:
1. Used GetX for State management.
2. Used Mockito for generating Mock classes for testing widgets and services
3. To generate mock files build_runner has to be executed
```
>    1. flutter pub run build_runner build
>    2. flutter pub run build_runner build --delete-conflicting-outputs
```
4. Code coverage added

### Flutter Code Coverage:
Use the following steps to generate coverage reports and test the code:
```
> 1. Run the command: flutter test --coverage
> 2. Install Code Coverage "lcov" if it's not installed already with this command: brew install lcov
> 3. To generate the report run the following command: genhtml coverage/lcov.info -o coverage/html
> 4. To view the generated HTML Reports run the following command: open coverage/html/index.html
```
