#!/bin/bash
set -e

if [ ! -f .env ]; then
  echo "Erreur : fichier .env introuvable. Copiez .env.example vers .env"
  exit 1
fi

export $(grep -v '^#' .env | xargs)

envsubst < templates/apple-app-site-association.tpl > public/.well-known/apple-app-site-association
envsubst < templates/assetlinks.json.tpl > public/.well-known/assetlinks.json

echo "Configuration Elya générée avec succès dans public/.well-known/"
