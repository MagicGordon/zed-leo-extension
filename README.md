# Aleo for Zed

A Zed extension for Aleo and Leo language support.

## Features

- Syntax highlighting for Aleo files.
- Syntax highlighting for Leo files.
- Outline symbols for Leo programs, structs, records, mappings, functions, transitions, and tests.
- Runnable markers for Leo test functions annotated with `@test`.
- Leo snippets.
- Leo LSP integration through `leo-lsp` when it is available on `PATH`.

## Leo Tests

Zed currently requires a task template to bind runnable tags to commands. Add this once to your global Zed `tasks.json`:

```json
[
  {
    "label": "leo test $ZED_CUSTOM_test",
    "command": "leo",
    "args": ["test", "$ZED_CUSTOM_test"],
    "cwd": "$ZED_WORKTREE_ROOT",
    "tags": ["leo-test"],
    "save": "all",
    "use_new_terminal": false,
    "allow_concurrent_runs": true
  }
]
```

After this is configured, Leo functions annotated with `@test` show a runnable marker in the editor gutter.

## Tooling

The extension does not install Leo tooling. Install `leo`, `leo-fmt`, and `leo-lsp` separately, and make sure the commands are available on `PATH`.
