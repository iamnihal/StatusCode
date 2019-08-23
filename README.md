<h1 align="center">
  <br>
  <a href="https://github.com/iamnihal/StatusCode"><img src="https://raw.githubusercontent.com/iamnihal/StatusCode/master/logo.png" alt="StatusCode"></a>
  <br>
  StatusCode
  <br>
</h1>

<h4 align="center">StatusCode will check the HTTP status code of URLs from a given file.</h4>

![demo](Pic.png)

#### HTTP status Checker
StatusCode is written in Bash Shell Scripting and will check the HTTP status code of URLs from the file given as argument.
It uses curl command with -I flag to solely request headers of reponse and with cut command it trims out status code from it.

### Note:- 
It took me 4.11 seconds to check out 10 URLs. Though it also depends on your bandwidth.
