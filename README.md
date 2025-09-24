[![add-on registry](https://img.shields.io/badge/DDEV-Add--on_Registry-blue)](https://addons.ddev.com)
[![tests](https://github.com/ddev/ddev-qr/actions/workflows/tests.yml/badge.svg)](https://github.com/ddev/ddev-qr/actions/workflows/tests.yml)
[![last commit](https://img.shields.io/github/last-commit/ddev/ddev-qr)](https://github.com/ddev/ddev-qr/commits)
[![release](https://img.shields.io/github/v/release/ddev/ddev-qr)](https://github.com/ddev/ddev-qr/releases/latest)

# DDEV-QR <!-- omit in toc -->

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [What's a QR code?](#whats-a-qr-code)
- [Why do I want to use it?](#why-do-i-want-to-use-it)
- [Contributing](#contributing)
- [Credits](#credits)

## Overview

This add-on adds a command that encodes DDEV URLs into [QR codes](#whats-a-qr-code).

It uses [qrencode](https://fukuchi.org/works/qrencode/) to parse a URL string into a QR code that is displayed in the terminal.

This helps reduce errors and frustration when entering URLs on portable devices.

## Installation

```bash
ddev add-on get ddev/ddev-qr
ddev restart
```

After installation, make sure to commit the `.ddev` directory to version control.

## Usage

| Command            | Description                                                                                  |
| ------------------ | -------------------------------------------------------------------------------------------- |
| `ddev qr`          | Encodes the primary website. Eg. <https://example.ddev.site>. Shorthand for `ddev qr https`. |
| `ddev qr https`    | Encodes the HTTPS version of the primary website. Eg. <https://example.ddev.site>.           |
| `ddev qr http`     | Encodes the HTTP version of the primary website. Eg. <http://example.ddev.site>.             |
| `ddev qr share`    | Tries to find the share tunnel and encodes the random address.                               |
| `ddev qr _STRING_` | Encodes the value of `_STRING_`.                                                             |

Note: Using `ddev qr` or `ddev qr https` inside a Gitpod environment will encode the Gitpod-routed DDEV URL instead.

## What's a QR code?

A QR code is a two-dimensional barcode that can store a string of information such as a URL.
You can use a QR reader, such as the camera in you mobile phone, to read the image. In the case of a URL, a mobile phone can then visit the URL.

Below is QR code with <https://ddev.com> encoded.

![https://ddev.com](./images/ddev.com.png)

See [Scan QR codes on Camera from Google](https://support.google.com/camerafromgoogle/answer/12033278?hl=en).
See [Scan a QR code with your iPhone, iPad, or iPod touch](https://support.apple.com/en-us/102680).

## Why do I want to use it?

Initially, this addon was created for use with `ddev share` which (currently) uses ngrok.
When using the free tier service, ngrok generates a random string address to access your website:
Eg. <https://124-5da4-96-37-190.ngrok-free.app>

This is great but it's not so fun typing that string on a small keyboard.
Instead:

- Use DDEV to share the site: `ddev share`
- Generate a qr code: `ddev qr share`
- Scan with code with your phone to visit the site.

Similarly, when using DDEV in Gitpod, DDEV defers to Gitpod's routing system that also generates random complex strings.
Using `ddev qr` or `ddev qr https` inside a Gitpod environment will encode the Gitpod-routed DDEV URL instead. Eg. <https://ddev-qrdemo-cksfu15uj8u4.ws-us131.gitpod.io/>

## Contributing

PR are welcome, especially if they contain working tests.

## Credits

**Contributed and maintained by [@tyler36](https://github.com/tyler36)**
