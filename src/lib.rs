use zed_extension_api as zed;

const LEO_LSP_SERVER_ID: &str = "leo-lsp";
const LEO_LSP_BINARY: &str = "leo-lsp";

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
            LEO_LSP_SERVER_ID => {
                let settings =
                    zed::settings::LspSettings::for_worktree(LEO_LSP_SERVER_ID, worktree)?;
                let binary = settings.binary;
                let command = binary
                    .as_ref()
                    .and_then(|binary| binary.path.clone())
                    .or_else(|| worktree.which(LEO_LSP_BINARY))
                    .ok_or_else(|| {
                        "leo-lsp must be installed and available on PATH, or configured with lsp.leo-lsp.binary.path"
                            .to_string()
                    })?;
                let args = binary
                    .as_ref()
                    .and_then(|binary| binary.arguments.clone())
                    .unwrap_or_default();
                let mut env = worktree.shell_env();

                if let Some(binary_env) = binary.and_then(|binary| binary.env) {
                    env.extend(binary_env);
                }

                Ok(zed::Command { command, args, env })
            }
            server_id => Err(format!("unknown language server: {server_id}")),
        }
    }
}

zed::register_extension!(AleoExtension);
