# `prjna2srr.sh` : a portable script to convert IDs from PRJNA (BioProject accession ID) to SRR

If you want to convert IDs from GSE to SRR :point_right: [gse2srr.sh](https://github.com/akikuno/gse2srr)

## Features

- minimal dependencies (only `bash` and `wget`)

## Installation

```bash
wget https://raw.githubusercontent.com/akikuno/prjna2srr/main/prjna2srr.sh
```

## Usage

```bash
sh prjna2srr.sh <BioPorject Number>
```

### Example

```bash
sh prjna2srr.sh PRJNA427709
# SRR6425161
# SRR6425162
# SRR6425163
# SRR6425164
```
