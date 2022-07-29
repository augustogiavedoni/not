# not !

not ! is a mobile app both for Android and iOS made with [Flutter](https://flutter.dev). It was build using DDD as the architectural pattern. You may ask yourself what is DDD so I'll try to explain it.

### What is DDD?

According to [Martin Fowler](https://martinfowler.com/bliki/DomainDrivenDesign.html), "the Domain-Driven Design is an approach to software development that centers the development on programming a domain model that has a rich undestanding of the processes and rules of a domain."

[Here](https://github.com/ResoCoder/flutter-ddd-firebase-course/blob/master/ddd-architecture-proposal.svg) you can see a visual representation of the theoretical aspect of DDD. Eventually, if you want to know more about this design pattern, you can Google it.

## What is not ! all about?

At this point, you may know that not ! is a mobile app for **note taking**. Besides that, you can **make To-Do lists inside each note**. This is basically a dummy project that was intended to help me understand the Domain-Driven design. Nevertheless, the idea was also to build a nice UI to go along with the more technical aspect of the app.

## not ! functionalities

At the moment, with not ! you can:

- Create an account with your email and password (or you can choose to sign up with Google)
- Create a note
- Edit a note (the body or the color)
- Delete a note
- Add a To-Do to a note
- Edit a To-Do present inside a note (the name of the To-Do or if it is completed or not)
- Delete a To-Do present inside a note
- Change the order of the To-Dos

## What services does not ! use?

not ! uses **Firebase** as the back-end provider. Services such as **Authentication** and **Firestore** help not ! run as expected. Maybe in the future I'll implement my own back-end service with Spring Boot using AWS as the service provider (stay tuned for this).

## not ! backlog

You can see the backlog for this app [here](https://github.com/users/augiavedoni/projects/2)

## Reported issues

You can see the reported issues [here](https://github.com/augiavedoni/not/issues)

## Important!

Please, have in mind that this is an ongoing project and it may be subject to changes. Even bugs may be present that I'm not aware of. If you have ideas or suggestions, please do not hesitate to check the [Discussions](https://github.com/augiavedoni/not/discussions) section.
