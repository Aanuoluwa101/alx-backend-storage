#!/usr/bin/env python3
"""Defines a function that lists all documents in a collection"""


def list_all(mongo_collection):
    """Returns all documents in mongo_collection"""
    return mongo_collection.find()
