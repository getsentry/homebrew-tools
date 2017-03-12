#!/bin/bash

#pip install --user requests==2.10.0
pip install requests==2.10.0
pip install jinja2

python ./.ci/bump-formula.py
