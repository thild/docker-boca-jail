#!/bin/bash
touch ~/.pgpass
echo $DBHOST:5432:*:bocauser:$DBPASS > ~/.pgpass
chmod 600 ~/.pgpass

until psql -h "$DBHOST" -U "bocauser" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

boca-config-dbhost $DBHOST
boca-createjail

tail -f /dev/null
