# Welcome to MovieTheque

## Getting Started

A MovieTheque interacting with Web Semantique on [EndPoint](http://fr.dbpedia.org/) to provide universal informations.

This web serveur use web framework [Revel](https://godoc.org/github.com/revel/revel) and is written in [Go Language](https://golang.org/)

### Start the web server:

	go get -v    // Download external libraries

    revel run MovieTheque

   Run with <tt>--help</tt> for options.

### Go to http://localhost:9000/ and you'll see:

"It works"

### Description of Contents

The default directory structure of a generated Revel application:

    myapp               App root
      app               App sources
        controllers     App controllers
          init.go       Interceptor registration
        models          App domain models
        routes          Reverse routes (generated code)
        views           Templates
      tests             Test suites
      conf              Configuration files
        app.conf        Main configuration file
        routes          Routes definition
      messages          Message files
      public            Public assets
        css             CSS files
        js              Javascript files
        images          Image files

### Follow the guidelines to update or develop your application:

* The [Getting Started with Revel](http://revel.github.io/tutorial/index.html).
* The [Revel guides](http://revel.github.io/manual/index.html).
* The [Revel sample apps](http://revel.github.io/samples/index.html).
* The [API documentation](https://godoc.org/github.com/revel/revel).
