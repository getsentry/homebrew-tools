#!/bin/bash

if [ ! -d .venv ]; then
  virtualenv .venv
  .venv/bin/pip install requests==2.10.0
  .venv/bin/pip install Jinja2
fi

.venv/bin/python ./scripts/bump-formula.py
