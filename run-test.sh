#!/bin/sh

ARGS="$@"

runjava com.rabbitmq.perf.PerfTest --uri "${RABBITMQ_URI}" "${ARGS}"