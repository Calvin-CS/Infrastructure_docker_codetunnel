#!/bin/bash

# Note: this relies on Docker secrets to build, but that secret is not stored in Git.  This build script looks up one directory and down into a secrets subdir
# For github actions, should rely on the Github secrets stuff, adding each one seperately

docker build -t codetunnel:latest --secret id=CODETUNNEL_SSH_HOST_ECDSA_KEY,src=../secrets/CODETUNNEL_SSH_HOST_ECDSA_KEY.env --secret id=CODETUNNEL_SSH_HOST_ECDSA_KEY_PUB,src=../secrets/CODETUNNEL_SSH_HOST_ECDSA_KEY_PUB.env --secret id=CODETUNNEL_SSH_HOST_ED25519_KEY,src=../secrets/CODETUNNEL_SSH_HOST_ED25519_KEY.env --secret id=CODETUNNEL_SSH_HOST_ED25519_KEY_PUB,src=../secrets/CODETUNNEL_SSH_HOST_ED25519_KEY_PUB.env --secret id=CODETUNNEL_SSH_HOST_RSA_KEY,src=../secrets/CODETUNNEL_SSH_HOST_RSA_KEY.env --secret id=CODETUNNEL_SSH_HOST_RSA_KEY_PUB,src=../secrets/CODETUNNEL_SSH_HOST_RSA_KEY_PUB.env .
