class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.50.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.50.0/sentry-darwin-arm64.gz"
      sha256 "0b0e857366a5676c452ad93c57e3d86dff828e3189f24c65caf3d89517312692"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.50.0/sentry-darwin-x64.gz"
      sha256 "14b8eef50cfb9f22ac5feef4e90a4d85b320eaaa3807fc3e117b42a583cc0249"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.50.0/sentry-linux-arm64.gz"
      sha256 "e8a2afda8cb644ae1b410029121fe89f06da039835769ee81a1d171bb5459999"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.50.0/sentry-linux-x64.gz"
      sha256 "acbc613130f9dbf6341d1f334594b81946253d8ff9281ae877985f243aa163aa"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
    # The release asset is a bare gzip, so the unpacked binary has no
    # exec bit. Homebrew's cleaner only fixes that after `install`.
    chmod 0755, bin/"sentry"
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
