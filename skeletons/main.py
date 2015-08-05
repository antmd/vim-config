#!/usr/bin/env python
"""
A test program
"""
from __future__ import division, absolute_import, print_function
__author__ = '<+AUTHOR+>'

import logging
import argparse


def main():
    """ ----------------------------------------------------------------------
    MAIN
    ---------------------------------------------------------------------- """
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--loglevel', default=None, help='Set the log level')
    args = parser.parse_args()

    #{{{ Configure logging
    LOG_FORMAT = "%(levelname)s %(asctime)s %(filename)s:%(lineno)d | %(message)s"
    log_level = args.loglevel if args.loglevel else 'INFO'
    logging.basicConfig(format=LOG_FORMAT, level=log_level)
    #}}}

    logging.info("Starting!")


if __name__ == "__main__":
    main()

# vi:foldmethod=marker:

