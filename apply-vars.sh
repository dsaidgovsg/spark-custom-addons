#!/usr/bin/env sh
if ! which jinja2 >/dev/null; then
    echo "Run \"python3 -m pip install --user jinja2-cli[yaml]\" to install jinja2 first."
fi

jinja2 .travis.yml.tmpl vars.yml > .travis.yml
echo "DONE!"
