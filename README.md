## Supremo

### About

Supremo is a javascript library which requires JavaScript files on the fly, when the required function/variable is accessed.

### How it works:

The library must be initalized passing a configuration object to `Supremo.init`. Next, it builds a wrapper for each variable/function, and when that variable/function is accessed it will download the file, evaluate and return the content of that variable/function.

### Getting started

Download `lib/supremo.js` and include it in your html page.

Next, initialize supremo with the config file:


```javascript
Supremo.init({
    App: {
        Views: {
            Login: {
                url: "/path/to/login.js" 
            },
            Register: {
                url: "/path/to/register.js"
            }
        },
        Models: {
            User: {
                url: "/path/to/models/user.js"
            },
            Post: {
                url: "/path/to/models/post.js"
            }
        }
    }
})

### Contributing

* fork the project
* make the changes
* write specs
* send pull request