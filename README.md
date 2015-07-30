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
    marathon-url: http://your-marathon-url.com
    app-name: my-app
    app-json-file: my-app.json
    instances: "3"
```
