# This formula is maintained by development/homebrew/render_formula.sh in
# msgmate-io/open-chat-go. Do not edit the version, URLs or checksums by hand:
# run the script (or the Homebrew Formula Bump workflow) so they stay in sync
# with the published release assets.
class OpenChat < Formula
  desc "Open source, privacy focused Chat-GPT alternative with tools and integrations"
  homepage "https://github.com/msgmate-io/open-chat-go"
  version "0.0.829"

  on_macos do
    on_arm do
      url "https://github.com/msgmate-io/open-chat-go/releases/download/open-chat-0.0.829/open-chat-0.0.829-darwin-arm64"
      sha256 "05eb67c9e0861da2d8052278d4009866226f1b91e144d17686d58cb8930ce710"
    end

    on_intel do
      url "https://github.com/msgmate-io/open-chat-go/releases/download/open-chat-0.0.829/open-chat-0.0.829-darwin-amd64"
      sha256 "3560a96f2100d587fb9ef7c76fbc67baa927dc583cd85538dde982b94f15cbda"
    end
  end

  def install
    binary = Dir["open-chat-*"].first
    odie "open-chat binary not found in downloaded archive" if binary.nil?

    bin.install binary => "open-chat"
  end

  def post_install
    (var/"open-chat").mkpath
    (var/"log").mkpath
  end

  service do
    run [opt_bin/"open-chat", "service", "run", "--host", "127.0.0.1", "--port", "1984"]
    working_dir var/"open-chat"
    keep_alive true
    log_path var/"log/open-chat.log"
    error_log_path var/"log/open-chat.err.log"
    # Without ROOT_CREDENTIALS the server refuses to boot (it will not silently
    # invent an unknown admin password). "admin:random" tells it to generate a
    # random admin password on first boot and print it to the log above.
    environment_variables ROOT_CREDENTIALS: "admin:random"
  end

  test do
    assert_match "Open Chat command line interface", shell_output("#{bin}/open-chat --help")
  end
end
