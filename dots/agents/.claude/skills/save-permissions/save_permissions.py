#!/usr/bin/env python3
"""
Helper script to add permissions to Claude Code settings.
Usage: python save_permissions.py "description:pattern" ["description2:pattern2" ...]
"""

import json
import sys
from pathlib import Path

def add_permissions(new_permissions):
    """Add new permissions to settings.local.json"""
    settings_path = Path.home() / ".claude" / "settings.local.json"

    # Read existing settings
    if settings_path.exists():
        with open(settings_path, 'r') as f:
            settings = json.load(f)
    else:
        settings = {}

    # Initialize permissions structure if needed
    if 'permissions' not in settings:
        settings['permissions'] = {}
    if 'allow' not in settings['permissions']:
        settings['permissions']['allow'] = []

    # Add new permissions (avoid duplicates)
    existing = set(settings['permissions']['allow'])
    added = []

    for perm in new_permissions:
        # Format as Bash(description:pattern)
        bash_perm = f"Bash({perm})"
        if bash_perm not in existing:
            settings['permissions']['allow'].append(bash_perm)
            existing.add(bash_perm)
            added.append(bash_perm)

    # Write back
    with open(settings_path, 'w') as f:
        json.dump(settings, f, indent=2)

    return added

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python save_permissions.py 'description:pattern' ['description2:pattern2' ...]")
        sys.exit(1)

    permissions = sys.argv[1:]
    added = add_permissions(permissions)

    if added:
        print(f"Added {len(added)} permission(s):")
        for perm in added:
            print(f"  - {perm}")
    else:
        print("No new permissions added (all already exist)")
