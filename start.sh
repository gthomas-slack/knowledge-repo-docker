#!/usr/bin/env bash

echo
echo "Setting up server"
echo "--------"
echo

# Exit script if any command returns a non-zero status
set -e

if [ ! -d "/app/knowledge-example" ]; then
	echo "Cloning research repo "

	cd /app/
	if [ -z "$(ls -A knowledge-example)" ]; then
		echo "clone here"
		git clone https://github.com/gthomas-slack/knowledge-example.git
	fi
fi
echo Runtime context ${RUNTIME_CONTEXT}

echo "Waiting for MySQL"
sleep 30

echo
cd /app/
if [ "${RUNTIME_CONTEXT}" == "local" ]; then
    echo Starting local server
    echo ---
    knowledge_repo --repo ./knowledge-example deploy --config ./server_config.py --port ${PORT}
else
    echo Starting remote server
    echo ---
    knowledge_repo --repo ./knowledge-example deploy --config ./server_config.py --port ${PORT}

fi