#!/bin/bash

env

if [[ "${PDF}" == "true" ]]; then
  mdslides --include /tmp/src/slides/images/ --pdf /tmp/src/slides/slides.md
else
  mdslides --include /tmp/src/slides/images/ /tmp/src/slides/slides.md
  rsync -av --delete /tmp/slides/ /tmp/src/slides/out

  echo "###########################"
  echo "Done. Open ./out/index.html with your web browser"
  echo "Done. To print, open ./out/index.html?print-pdf with your web browser"
  echo "###########################"

fi
