#!/bin/bash
PARCEL="elephantbird-3.0.9"
export HADOOP_CLASSPATH=$PARCELS_ROOT/$PARCEL/java/elephant-bird-core-3.0.9.jar:$PARCELS_ROOT/$PARCEL/java/elephant-bird-pig-3.0.9.jar:$PARCELS_ROOT/$PARCEL/java/elephant-bird-hive-3.0.9.jar:$PARCELS_ROOT/$PARCEL/java/json-simple-1.1.1.jar
export HBASE_CLASSPATH=$HADOOP_CLASSPATH




