#!/bin/bash
#Filename: create-database.sh
#Description: Create MySQL database and table for March 2023 NY MUG Relational Migrator demo

USER="root" PASS=""

# if pass - mysql -u $USER -p$PASS <<EOF 2> /dev/null 
/Applications/XAMPP/bin/mysql -u $USER < Customers.sql 2>  /dev/null 

[ $? -eq 0 ] && echo Created DB || echo DB already exist
