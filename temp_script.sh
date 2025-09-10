#!/bin/bash
if [[ -z "" || -z "" ]]; then
  echo "Los secretos GIST_SECRET y GIST_ID no están configurados. Los badges no se generarán."
  echo "no_gist=true"
else
  echo "no_gist=false"
fi
