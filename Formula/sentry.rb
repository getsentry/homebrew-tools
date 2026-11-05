class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.48.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.48.0/sentry-darwin-arm64.gz"
      sha256 "53ca6e7ccf26679e39a9d25146bcdc9739b97e2e5b5c5f39a9ed12ec32274dff"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.48.0/sentry-darwin-x64.gz"
      sha256 "4921977721f74576e04b216bf1b172fc23e8537999bd9c9aa24e4f6efe38b553"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.48.0/sentry-linux-arm64.gz"
      sha256 "3c511c32aa0400098a38dd88ba2d72a2b7c0468ec8921dadbb1e957cdb973441"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.48.0/sentry-linux-x64.gz"
      sha256 "54f2e0a1766ac1556bae46ca3d95fc47960f026f6c23ee4cbbbdf1e45444ff44"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
    # Homebrew-managed completion dirs survive the build sandbox and
    # are cleaned up by `brew uninstall`. Writing into $HOME from
    # post_install does not work: it runs under a throwaway HOME.
    generate_completions_from_executable(bin/"sentry", "cli", "completion")
  end

  def caveats
    <<~EOS
      Shell completions for bash, zsh, and fish are installed by Homebrew.

      To install the Sentry CLI skill for detected AI coding agents, run:
        sentry cli setup --no-modify-path --no-completions

      `sentry cli upgrade` refreshes the skill automatically. After a
      `brew upgrade`, run the command above again.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry --version").chomp
  end
end
