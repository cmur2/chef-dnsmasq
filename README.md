# chef-dnsmasq

[![Build Status](https://travis-ci.org/cmur2/chef-dnsmasq.png)](https://travis-ci.org/cmur2/chef-dnsmasq)

## Description

Installs and configures [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html) in a very flexbile manner.

## Usage

Use `recipe[dnsmasq::default]` for getting dnsmasq installed and configured via */etc/dnsmasq.conf* without any additional services like other cookbooks do. You can use and set all configuration options because of a flexible generator this cookbook uses.

## Requirements

### Platform

It should work on all OSes that provide a dnsmasq package and assume the configuration file at */etc/dnsmasq.conf*.

For supported Chef/Ruby version see [Travis](https://travis-ci.org/cmur2/chef-dnsmasq).

## Recipes

### default

Configures dnsmasq from data found below `node['dnsmasq']['config']`, where each key value pair is handeled like this: If the value is an array there will multiple lines with the same key and these different values. Each value (whether arrayed or not) can have different types:

* `true`: Use for boolean values, they result in `key` for simple setting options like `domain-needed`, `bogus-priv` etc.
* `Integer`: Direct mapping of integers (useful esp. for port numbers).
* `String`: The string is pasted into the file without modification.

## License

chef-dnsmasq is licensed under the Apache License, Version 2.0. See LICENSE for more information.
