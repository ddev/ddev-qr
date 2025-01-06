[![tests](https://github.com/tyler36/ddev-qr/actions/workflows/tests.yml/badge.svg)](https://github.com/tyler36/ddev-qr/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2026.svg)

# DDEV-QR <!-- omit in toc -->

- [Introduction](#introduction)
- [Getting started](#getting-started)
- [Usage](#usage)
- [What's a QR code?](#whats-a-qr-code)
- [Why do I want to use it?](#why-do-i-want-to-use-it)
- [Components of the repository](#components-of-the-repository)
- [Contributing](#contributing)

## Introduction

DDEV-QR is a DDEV add-on that encodes DDEV URLs into [QR codes](#whats-a-qr-code).

It uses [qrencode](https://fukuchi.org/works/qrencode/) to parse a URL string into a QR code that is displayed in the terminal.

This helps reduce errors and frustration when entering URLs on portable devices.

## Getting started

1. Install the app.

    For DDEV v1.23.5 or above run

    ```shell
    ddev add-on get tyler36/ddev-qr
    ```

    For earlier versions of DDEV run

    ```shell
    ddev get tyler36/ddev-qr
    ```

    Then restart your project

    ```shell
    ddev restart
    ```

## Usage

This add-on add a new command, `qr` that will generate a QR code as follows:

- `ddev qr`: Encodes the primary website. Eg. <https://example.ddev.site>. Shorthand for `ddev qr https`.
- `ddev qr https`: Encodes the HTTPS version of the primary website. Eg. <https://example.ddev.site>.
- `ddev qr http`: Encodes the HTTP version of the primary website. Eg. <http://example.ddev.site>.
- `ddev qr share`: Tries to find the share tunnel and encodes the random address.
- `ddev qr _STRING_`: Encodes the value of `_STRING_`.

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

Similar, when using DDEV in Gitpod, DDEV defers to Gitpod's routing system that also generates random complex strings.
Using `ddev qr` or `ddev qr https` inside a Gitpod environment will encode the Gitpod-routed DDEV URL instead. Eg. <https://tyler36-qrdemo-cksfu15uj8u4.ws-us131.gitpod.io/>

## Components of the repository

- `commands/host/qr`: A helper command to interact with the encoder.
- `Dockerfile.qrencode`: Docker file that installs `qrencode` inside the web container.

## Contributing

PR are welcome, especially if they contain working tests.

**Contributed and maintained by [@tyler36](https://github.com/tyler36)**
