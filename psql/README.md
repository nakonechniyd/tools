# postgresql client

# info
https://www.postgresql.org/docs/current/app-psql.html

# build
docker build --file psql.dockerfile --tag nakonechniyd/psql .

# create shell wrapper (e.g. at $HOME/.local/bin)
[psql](./psql)

# add permissions
chmod +x psql
