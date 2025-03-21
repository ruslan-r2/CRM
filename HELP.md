# Getting Started

### Справочная документация

Для получения дополнительной информации, пожалуйста, ознакомьтесь со следующими разделами:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/3.4.3/maven-plugin)
* [Create an OCI image](https://docs.spring.io/spring-boot/3.4.3/maven-plugin/build-image.html)
* [Spring Data JPA](https://docs.spring.io/spring-boot/3.4.3/reference/data/sql.html#data.sql.jpa-and-spring-data)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/3.4.3/reference/using/devtools.html)
* [Docker Compose Support](https://docs.spring.io/spring-boot/3.4.3/reference/features/dev-services.html#features.dev-services.docker-compose)
* [Flyway Migration](https://docs.spring.io/spring-boot/3.4.3/how-to/data-initialization.html#howto.data-initialization.migration-tool.flyway)
* [Spring Security](https://docs.spring.io/spring-boot/3.4.3/reference/web/spring-security.html)
* [Spring Session](https://docs.spring.io/spring-session/reference/)
* [Thymeleaf](https://docs.spring.io/spring-boot/3.4.3/reference/web/servlet.html#web.servlet.spring-mvc.template-engines)
* [Validation](https://docs.spring.io/spring-boot/3.4.3/reference/io/validation.html)
* [Spring Web](https://docs.spring.io/spring-boot/3.4.3/reference/web/servlet.html)

### Справочные материалы или документация

В следующих руководствах показано, как конкретно использовать некоторые функции:

* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)
* [Securing a Web Application](https://spring.io/guides/gs/securing-web/)
* [Spring Boot and OAuth2](https://spring.io/guides/tutorials/spring-boot-oauth2/)
* [Authenticating a User with LDAP](https://spring.io/guides/gs/authenticating-ldap/)
* [Handling Form Submission](https://spring.io/guides/gs/handling-form-submission/)
* [Validation](https://spring.io/guides/gs/validating-form-input/)
* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)

### Docker Compose support

Этот проект содержит файл Docker Compose с именем `compose.yaml`.
В этом файле определены следующие службы:

* postgres: [`postgres:15.0`](https://hub.docker.com/_/postgres)
* spring-crm: 

Пожалуйста, просмотрите теги используемых образов и установите для них те же значения, 
которые используются в рабочей среде.

### Maven Parent overrides

Due to Maven's design, elements are inherited from the parent POM to the project POM.
While most of the inheritance is fine, it also inherits unwanted elements like `<license>` and `<developers>` from the
parent.
To prevent this, the project POM contains empty overrides for these elements.
If you manually switch to a different parent and actually want the inheritance, you need to remove those overrides.

