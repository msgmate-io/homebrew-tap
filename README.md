# msgmate-io Homebrew tap

Homebrew formulae for [msgmate-io](https://github.com/msgmate-io) projects.

## open-chat

Open source, privacy focused Chat-GPT alternative with tools and integrations.

```sh
brew install msgmate-io/tap/open-chat
brew services start open-chat
open-chat status
```

The server listens on `127.0.0.1:1984`, keeps its database under
`$(brew --prefix)/var/open-chat` and writes logs to
`$(brew --prefix)/var/log/open-chat.log` (and `open-chat.err.log`).

```sh
brew services restart open-chat
brew upgrade open-chat
brew services stop open-chat
brew uninstall open-chat
```

Requires macOS 13+ on Apple Silicon or Intel.

## Maintenance

`Formula/open-chat.rb` is generated from the release assets by
`development/homebrew/render_formula.sh` in
[msgmate-io/open-chat-go](https://github.com/msgmate-io/open-chat-go). Production
releases update it automatically via the `Homebrew Formula Bump` workflow. Do not
hand-edit the version, URLs or checksums.