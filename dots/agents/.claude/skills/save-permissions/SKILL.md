---
name: save-permissions
description: Save all permission requests from the current chat to allowed config
---

Review the current conversation and identify all tool permission requests that were made.

For each permission request:
1. Identify the tool type (Bash, Read, Edit, Write, Glob, Grep, etc.)
2. Extract the permission description (the semantic description of what the operation does)
3. Determine the appropriate pattern (use `*` for general permissions or specific patterns)

Then add these permissions to `~/.claude/settings.local.json` in the format:
```
ToolName(description:pattern)
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
- `Read(read config files:**/settings*.json)`
- `Read(read source files:**/*.py)`
- `Edit(edit config files:**/settings*.json)`
- `Write(create new files:*)`
- `Glob(search for files:**/*)`
- `Grep(search file contents:*)`
