#!/usr/bin/env python3
"""Print POSIX commands to modify shell environment."""

# Next steps:
# Break unset/set into classes
# Use a config.ini to specify behaviour...

import os
import os.path


def unset(var):
    """Print POSIX command to unset environment variable."""
    print("unset {};".format(var))


def set_var(var, value):
    """Print POSIX command to set environment variable."""
    print("export {}={};".format(var, value))


# check for environment variables
UNSET_ON_EXIT = "UNSET_ON_EXIT"
unset_envs = os.getenv(UNSET_ON_EXIT)
if unset_envs:
    print("echo Unsetting: {};".format(unset_envs))
    for var in unset_envs.split(","):
        unset(var)
    unset(UNSET_ON_EXIT)

extra_envs_file = os.path.join(os.getcwd(), '.extra_envs')
if os.path.exists(extra_envs_file):
    new_vars = []
    for line in open(extra_envs_file):
        if line.startswith("#"):
            continue

        parts = line.split("=")
        if len(parts) != 2:
            # Dont do anything with lines like this
            continue
        set_var(parts[0], parts[1])
        new_vars.append(parts[0])
    all_vars = ",".join(new_vars)
    print("echo Setting {};".format(all_vars))
    set_var(UNSET_ON_EXIT, all_vars)

# check for .venv
UNSET_VENV = "UNSET_VENV"
if os.getenv(UNSET_VENV):
    print("echo Deactivating .venv;")
    print("deactivate;")
    unset(UNSET_VENV)

venv_folder = os.path.join(os.getcwd(), '.venv')
if os.path.exists(venv_folder):
    print("echo Detected .venv, activating...;")
    print("source {};".format(os.path.join(venv_folder, "bin", "activate")))
    set_var("UNSET_VENV", 1)
