#!/bin/bash
set -e

git clone  -b ${deploy_branch} https://${deploy_key_name}:${deploy_key_token}@${deploy_url}/${deploy_software}.extend.git
cd ${deploy_software}.extend
make
./${deploy_software} -c milter.conf
rsyslogd
exec /bin/bash
