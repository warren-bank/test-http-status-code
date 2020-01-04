### [test-http-status-code](https://github.com/warren-bank/test-http-status-code)

Windows 'cmd' shell script to process a list of URLs and produce a filtered list that only contains the URLs that return an HTTP status code in the range 200-299.

#### Usage:

```bash
test-http-status-code /path/to/input.txt [/path/to/output.txt]
```

__params:__

1. [required] `/path/to/input.txt`
   - one URL per line
   - URL is only processed if it begins with the case-sensitive lowercase string: `http`
2. [optional] `/path/to/output.txt`
   - one URL per line
   - URL is only included if its server returns an HTTP status code in the range 200-299
   - default value: `/path/to/input.txt.result`

__dependencies:__

* `curl` needs to be in `PATH`

__custom configuration:__

* environment variable: `curl_opts`
  - ex:
    * to follow 3xx redirects:<br>`set curl_opts=-L`

#### Legal:

* copyright: [Warren Bank](https://github.com/warren-bank)
* license: [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)
