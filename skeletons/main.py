#!/usr/bin/env python
from __future__ import division, absolute_import, print_function
__author__ = 'Anthony Dervish'

import logging
import logging.config
import argparse

def configure_logging(log_level='DEBUG'):
    stream_handler = (lambda x: 'logging.StreamHandler' if x else 'logging.NullHandler')(log_level)
    handlers_dict = {'console': {'class': stream_handler, 'level': log_level}}
    LOG_CONFIG = {'version': 1, 'handlers': handlers_dict, 'root': {'handlers': ['console'], 'level': logging.DEBUG} }
    logging.config.dictConfig(LOG_CONFIG)

""" ----------------------------------------------------------------------
MAIN
---------------------------------------------------------------------- """

def main():
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('--loglevel', default=None, help='Set the log level')
    parser.add_argument('--dostuff', action='store_true', help='do stuff')

    args = parser.parse_args()

    log_level = (lambda x: x if x else 'INFO')(args.loglevel)
    configure_logging(log_level)

    logging.info("Starting!")
 
if __name__ == "__main__":
    main()
