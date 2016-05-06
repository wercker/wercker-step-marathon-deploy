This step allows you to deploy a json file to a marathon instance. It requires `curl` to be installed on the container.

The following paramaters are available:

* marathon-url (string, required)
* app-name (string, required)
* app-json-file (string, required)
* instances (string, optional)
* auth-token (string, optional)

Note that while `instances` should in fact be a number, it is still neccessary to use quotes.

Example usage

```
deploy:
  steps:
    - wercker/marathon-deploy:
        marathon-url: http://your-marathon-url.com
        app-name: my-app
        app-json-file: my-app.json
        instances: "3"
        auth-token: $AUTH_TOKEN
```
