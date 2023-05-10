# test_worldline

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

- This project meets the requirements of the test, is organized with a layered architecture, data layer, domain and presentation, also includes annex directory called infrastructure to contain some tools necessary for the proper functioning of the project as the dependency injector, the enroute, the environment configuration (dev, prod, etc) and fault management.
- I have used only one data model that is in the repository layer because I did not find it necessary to have 2 different models, although it could be added for other more complex use cases or with more data.
- In the data layer we have our datasource is divided in 2, local repository and remote repository, the local one works with the SQFLite database and the remote one works with the http Dio request manager library.


### Possible improvements: 
- Add a more scalable error management and add an error logging platform such as Datadog or Crashlytics,
- Adding widget testing and unit testing
- Implement the different environments 