---
name: save-permissions
description: Save all permission requests from the current chat to allowed config
---

Review the current conversation and identify all Bash permission requests that were made.

For each permission request:
1. Extract the permission description (the semantic description of what the command does)
2. Determine the appropriate pattern (use `*` for general permissions or specific patterns)

Then add these permissions to `~/.claude/settings.local.json` in the format:
```
Bash(description:pattern)
```

After adding the permissions, show a summary of what was added.

**Important:**
- Read the current settings.local.json file first
- Don't duplicate existing permissions
- Preserve the JSON structure
- Create semantic descriptions that cover the class of operations, not just the specific command
- Use `*` pattern for broad permissions, or specific patterns for narrow permissions

**Example permissions:**
- `Bash(install dependencies:npm install*)`
- `Bash(run tests:npm test*)`
- `Bash(git operations:git *)`
- `Bash(file operations:cat *)`
