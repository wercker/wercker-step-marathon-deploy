This step allows you to deploy a json file to a marathon instance.

The following paramaters are available:

* marathon-url (string, required)
* app-name (string, required)
* app-json-file (string, required)
* instances (string, optional) 

Note that while instances should be in fact a number, it is still neccessary to use quotes.

Example usage

```
- wercker/marathon-deploy:
    marathon-url: $MARATHON_ENDPOINT
    app-name: $APP_NAME
    app-json-file: $APP_NAME.json
    instances: "3"
```
