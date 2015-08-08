#!/bin/bash

/usr/bin/curl "http://localhost:23119/better-bibtex/cayw?keyprefix=%40&citeprefix=%5B&citepostfix=%5D" | /usr/bin/pbcopy
