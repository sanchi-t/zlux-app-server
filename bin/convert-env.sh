#!/bin/sh
# This program and the accompanying materials are
# made available under the terms of the Eclipse Public License v2.0 which accompanies
# this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
#
# SPDX-License-Identifier: EPL-2.0
#
# Copyright Contributors to the Zowe Project.

# shape old env vars into app-server compatible ones
# mediation layer
if [[ $APIML_ENABLE_SSO == "true" ]]; then
  if [ -z "$ZWED_node_mediationLayer_server_gatewayPort" ]
  then
    export ZWED_node_mediationLayer_server_gatewayPort=$GATEWAY_PORT
  fi
fi
if [ -z "$ZWED_node_mediationLayer_server_port" ]
then
  export ZWED_node_mediationLayer_server_port=$DISCOVERY_PORT
fi
if [ -z "ZWED_node_mediationLayer_server_hostname" ]
then
  export ZWED_node_mediationLayer_server_hostname=$ZOWE_EXPLORER_HOST
fi

# app server
if [ -z "$ZWED_node_https_port" ]
then
  export ZWED_node_https_port=$ZOWE_ZLUX_SERVER_HTTPS_PORT
fi

# zss
if [ -z "$ZWED_agent_http_port" ]
then
  export ZWED_agent_http_port=$ZOWE_ZSS_SERVER_PORT
fi
if [ -z "$ZWED_privilegedServerName" ]
then
  export ZWED_privilegedServerName=$ZOWE_ZSS_XMEM_SERVER_NAME
fi
