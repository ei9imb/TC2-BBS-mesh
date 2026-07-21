#!/bin/sh
if [ ! -f "/config/config.ini" ]; then
    cp "/cumann-muscrai-bbs/example_config.ini" "/config/config.ini"
fi
if [ ! -f "/config/fortunes.txt" ]; then
    cp "/cumann-muscrai-bbs/fortunes.txt" "/config/fortunes.txt"
fi
