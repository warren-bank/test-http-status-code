#!/usr/bin/env bash

PATH="../../bin:${PATH}"

curl_opts=(-H 'User-Agent: Mozilla')
[[ $curl_opts ]] && export declare_curl_opts=$(declare -p curl_opts)

file_in=./in.txt
file_out=./out-lin.txt

test-http-status-code "$file_in" "$file_out"
