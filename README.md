# `prjna2srr.sh` : Portable script to convert PRJNA (BioProject accession ID) to SRR


https://user-images.githubusercontent.com/15861316/228703263-85ae7bdd-dda8-4e04-bccb-16223b92402d.mp4


## Features

- minimal dependencies
  - `bash`
  - `wget` or `curl`

## Installation

```bash
curl -O https://raw.githubusercontent.com/akikuno/prjna2srr/main/prjna2srr.sh
# or
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

## Other tools

- [gse2srr.sh](https://github.com/akikuno/gse2srr) : to convert IDs from GSE to SRR

## Questions and bug reporting

Questions, bug reporting or any inqueries are always welcome!  
Please reprt to the [GitHub Issues](https://github.com/akikuno/prjna2srr/issues)  

- Questions by creating a new issue with the **question** tag
- Bugs by creating a new issue with the **bug** tag
