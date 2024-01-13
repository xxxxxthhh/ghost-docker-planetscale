#/bin/bash
# This is a patch for the knex-migrator package
# It is needed because the package can't detect if the database already exists
# in PlanetScale.
# 
# This patch may break if the knex-migrator package is updated.
# Message me if it breaks and I'll update it:
# https://twitter.com/justfizzbuzz or thepiesaresquared@gmail.com
# 
# Or alternatively, you can open a PR or issue requesting a special 
# case for PlanetScale in knex-migrator's repo:
# https://github.com/TryGhost/knex-migrator
# 

file_path="current/node_modules/knex-migrator/lib/database.js"
text_to_add="const isDBExists = err.errno == 1105 && err.sqlMessage.endsWith('database exists');\\
if(isDBExists) return Promise.resolve();\\
"
line_number=129

sed -i "${line_number}i${text_to_add}" "$file_path"
