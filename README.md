### [test-http-status-code](https://github.com/warren-bank/test-http-status-code)

Shell script to process a list of URLs and produce a filtered list that only contains the URLs that return an HTTP status code in the range 200-299.

__shells:__

* Windows `cmd`
* Bash

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
  - tested with:
    ```text
      curl 7.58.0 (i686-pc-mingw32) libcurl/7.58.0 GnuTLS/3.4.17 zlib/1.2.11 c-ares/1.13.0 libidn2/2.0.4 libpsl/0.18.0 (+libidn2/2.0.4) libssh2/1.8.0 nghttp2/1.27.0 librtmp/2.3
      Release-Date: 2018-01-24
    ```

__custom configuration:__

* environment variable: `curl_opts`
  - ex:
    * to follow 3xx redirects
      - Windows `cmd`:
        ```bash
          set curl_opts=-L
        ```
      - Bash:
        ```bash
          curl_opts=(-L)
          [[ $curl_opts ]] && export declare_curl_opts=$(declare -p curl_opts)
        ```

#### Legal:

* copyright: [Warren Bank](https://github.com/warren-bank)
* license: [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)
