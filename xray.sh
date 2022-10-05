#!/bin/sh

# config xray
cat << EOF > /etc/config.json
{
  "inbounds":[
    {
      "port": $PORT,
      "protocol": "$PROTOCOL",
      "settings": {
        "clients": [
          {
            "id": "$UUID"
          }
        ]
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}	
EOF

# run xray
/usr/bin/xray run -config /etc/config.json
