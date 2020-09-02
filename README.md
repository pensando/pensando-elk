<img src="https://pensando.io/wp-content/themes/pensando/assets/images/logo.svg" alt="My cool logo" width="350"/>


ELK based analytics for Pensado Systems

This repository is the starting point for building and utlizing the Elasticstack for monitoring and analyzing
data, both about and traversing, the Pensando DSC(s) within your environment.  The purpose is to consolidate the
applications and tools used for said monitoring and analysis and deploy them in an automated fashion.

Instantiation can be done on either a single CentOS 8.x or Ubuntu 18.04 (or newer) BMS or VM.
This is broken into 3 atomic processes, namely:
1.) [Installation](docs/install)  (run once)
2.) [Running](docs/run-pensando-elk)  (recurring)
3.) [Setup](docs/setup)  (run once)


In addition to the base ElasticStack it also contains:
- [Pensando Filebeat](https://github.com/pensando)
- [Elastiflow 4.0](https://github.com/robcowart/elastiflow/tree/4.x-dev)
- [Suricata](https://suricata-ids.org/)
- [Zeek](https://zeek.org/)

## Installation
To install and run Pensando ELK, refer to the [documentation at rtfd.io](http://pensando-elk.rtfd.io)
## Support Policy
The code and templates in the repo are released under an as-is, best effort, support policy. These scripts should be seen as community supported and Pensando will contribute our expertise as and when possible. We do not provide technical support or help in using or troubleshooting the components of the project through our normal support options. Unless explicitly tagged, all projects or work posted in our GitHub repository (at https://github.com/Pensando) or sites other than our official Downloads page on https://support.pensando.io are provided under the best effort policy.
