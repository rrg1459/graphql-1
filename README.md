# App para trabajar con graphQL

## Se corre los comandos para cargar las gemas y crear la BD

```
 $ bundle install
 $ rails db:migrate
 $ rails db:seed
```

## Para usar graphql

Se debe agregar las gemas de graphql

```
 $ bundle add graphql graphiql-rails
```

Luego instalar el ambiente de graphql

```
 $ rails generate graphql:install
```

Para verificar que se está ejecutando correctamente graphql
en el browser

http://localhost:3000/graphiql

Y en la zona de queries esto:

```
query {
  testField
}
```

La respuesta debe ser algo como esto:

```
{
  "data": {
    "testField": "Hello World!"
  }
}
```

---

## Para Ejecutar Altair y poder ver desde heroku se debe agregar la gema de cors

```
 $ bundle add rack-cors
```

 Y en ***app/controllers/application_controller.rb***

 este método:.

```
  def verify_authenticity_token
    request.headers['X-CSRF-Token'] ||= request.headers['X-XSRF-TOKEN']
  end
```

y en ***config/application.rb***

este otro método dentroi de la clase  class Application < Rails::Application

## soporte para el uso compartido de recursos de origen cruzado (CORS)
```
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', 
        headers: :any, 
        methods: [:get, :post, :options]
      end
    end
```

## Verificar que se puede ver graphql con Altair y su equivalente en heroku

http://localhost:3000/graphql

https://monograma.herokuapp.com/graphql

---
