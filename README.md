# tomcat-docker-container-urlrewrite

Simple Tomcat Docker container that uses Tuckey's URLrewrite module

## Files

1. [src/urlrewrite.xml](src/urlrewrite.xml) - File with all the redirects, for more information on syntax and flags visit https://www.tuckey.org/urlrewrite/
2. [src/urlrewritefilter-4.0.3.jar](src/urlrewritefilter-4.0.3.jar) - JAR file to extend Tomcat
3. [src/web.xml](src/web.xml) - Config file, as vanilla as possible with the `UrlRewriteFilter` filter added at the bottom between lines 165-174.

## How to use

1. _(optional)_ Set up a host (default: `http://localhost`)
2. Open Terminal
3. Navigate to root folder with Docker files
4. Run `docker-compose up --build`
5. Open new Terminal window/tab
6. Run `curl -I http://localhost/hello-world`
7. Confirm response is a 301-Permanent redirect to `https://example.com/`

## Example

### Input

```
<rule>
  <name>https://localhost/hello-world to https://example.com/</name>
  <note>Random redirect as example</note>
  <condition name="host" operator="equal">localhost</condition>
  <from>^/hello-world$</from>
  <to type="permanent-redirect" last="true">https://example.com/</to>
</rule>
```
### Output

```
$ curl -I http://localhost/hello-world
HTTP/1.1 301 
Location: https://example.com/
Transfer-Encoding: chunked
Date: Thu, 27 Oct 2022 08:04:08 GMT
```