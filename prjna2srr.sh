#!/bin/bash
set -e

ACCESSION=$1
ACCESSION_ID="${ACCESSION#PRJNA}"

if [ -z "$ACCESSION" ]; then
    echo "Error: Please provide a PRJNA ID"
    exit 1
fi


if type curl >/dev/null 2>&1; then
    CMD_CURL='curl -s'
elif type wget    >/dev/null 2>&1; then
    CMD_CURL='wget -qO -'
else
    error_exit 1 'No HTTP-GET/POST command found.'
fi


SRX=$($CMD_CURL "https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=${ACCESSION_ID}" |
    tr "/" "\n" |
    grep ^SRX |
    head -n 1 |
    cut -d "[" -f 1)

if [ -z "$SRX" ]; then
    echo "No SRX found for ${ACCESSION}"
    exit 1
fi

SRP=$($CMD_CURL https://www.ncbi.nlm.nih.gov/sra/${SRX} |
    tr ">" "\n" |
    grep ^SRP |
    head -n 1 |
    cut -d "<" -f 1)

if [ -z "$SRP" ]; then
    echo "No SRP found for ${ACCESSION}"
    exit 1
fi

$CMD_CURL "https://ddbj.nig.ac.jp/resource/sra-study/${SRP}.jsonld" |
    tr "/" "\n" |
    grep ^SRR |
    cut -d '"' -f 1 |
    sort -u

exit 0
