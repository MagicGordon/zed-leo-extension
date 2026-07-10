use zed_extension_api as zed;

struct AleoExtension;

impl zed::Extension for AleoExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        match language_server_id.as_ref() {
            "leo-lsp" => {
                let command = worktree
                    .which("leo-lsp")
                    .ok_or_else(|| "leo-lsp must be installed and available on PATH".to_string())?;

                Ok(zed::Command {
                    command,
                    args: Vec::new(),
                    env: worktree.shell_env(),
                })
            }
            server_id => Err(format!("unknown language server: {server_id}")),
        }
    }
}

zed::register_extension!(AleoExtension);
