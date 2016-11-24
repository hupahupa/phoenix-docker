#!/bin/bash
sleep 10

direction=$MIGRATE

if [ "$direction" = "" ]
then
    direction="up"
fi
goose $direction
