#!/usr/bin/env python
import os
import sys
import requests
import hashlib
import jinja2


try:
    from requests.packages import urllib3
    urllib3.disable_warnings()
except ImportError:
    pass


REPO = 'getsentry/sentry-cli'
BIN = 'sentry-cli-Darwin-x86_64'


def sha256_checksum(filename, block_size=65536):
    sha256 = hashlib.sha256()
    with open(filename, 'rb') as f:
        for block in iter(lambda: f.read(block_size), b''):
            sha256.update(block)
    return sha256.hexdigest()


def render(tpl_path, context):
    path, filename = os.path.split(tpl_path)
    return jinja2.Environment(
        loader=jinja2.FileSystemLoader(path or './')
    ).get_template(filename).render(context)


def download_file(url):
    local_filename = url.split('/')[-1]
    r = requests.get(url, stream=True)
    with open(local_filename, 'wb') as f:
        for chunk in r.iter_content(chunk_size=1024):
            if chunk:
                f.write(chunk)
    return local_filename


def main():
    resp = requests.get('https://api.github.com/repos/%s/releases/latest' % REPO)
    resp.raise_for_status()
    release = resp.json()
    url = None
    version = None
    if release['draft'] is False:
        version = release['tag_name']
        for asset in release['assets']:
            if asset['name'] == BIN:
                url = asset['browser_download_url']
                break

    binary_filename = download_file(url)
    checksum = sha256_checksum(binary_filename)
    os.remove(binary_filename)

    context = {
        'version': version,
        'checksum': checksum
    }
    result = render('./.ci/templates/sentry-cli.rb.template', context)


if __name__ == '__main__':
    main()
