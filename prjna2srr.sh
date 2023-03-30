#!/bin/bash
set -e

ACCESSION=$1
ACCESSION_ID="${ACCESSION#PRJNA}"

SRX=$(wget -qO - "https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=${ACCESSION_ID}" |
    tr "/" "\n" |
    grep ^SRX |
    head -n 1 |
    cut -d "[" -f 1)

[ -z "$SRX" ] && echo "No SRX found for ${ACCESSION}" && exit 1

SRP=$(wget -qO - https://www.ncbi.nlm.nih.gov/sra/${SRX} |
    tr ">" "\n" |
    grep ^SRP |
    head -n 1 |
    cut -d "<" -f 1)

[ -z "$SRP" ] && echo "No SRP found for ${ACCESSION}" && exit 1

wget -qO - "https://ddbj.nig.ac.jp/resource/sra-study/${SRP}.jsonld" |
    tr "/" "\n" |
    grep ^SRR |
    cut -d '"' -f 1 |
    sort -u

exit 0
