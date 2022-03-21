#!/bin/bash

set -e

KEY_DIR=~/client-configs/keys
OUTPUT_DIR=~/client-configs/files
BASE_CONFIG=~/client-configs/base.conf
EASYRSA_DIR=~/easy-rsa
cd ${EASYRSA_DIR}
./easyrsa --batch gen-req ${1} nopass
./easyrsa --batch sign-req client ${1}
cp ${EASYRSA_DIR}/pki/issued/${1}.crt ${KEY_DIR}
cp ${EASYRSA_DIR}/pki/private/${1}.key ${KEY_DIR}
cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-crypt>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-crypt>') \
    > ${OUTPUT_DIR}/${1}.ovpn 