class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.38.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.38.0/sentry-darwin-arm64.gz"
      sha256 "e9ce3591a0fa27d5bb2596010314ab59aea6a51ef0b1c10f3df5baed0a3adfd1"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.38.0/sentry-darwin-x64.gz"
      sha256 "ef273ba2fdfc7fc97c86bd26317540ea4002583bbeed2ae6b804383fac72f7f7"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.38.0/sentry-linux-arm64.gz"
      sha256 "e3655f847c632d3b74034c8cfbfc5a878a3c80a500dca4a4547c1f20a806978d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.38.0/sentry-linux-x64.gz"
      sha256 "41b74257528608c430ce4a637a65725018749c7086845e72890cbe88968154c7"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
  end

  def post_install
    system bin/"sentry", "cli", "setup", "--method", "brew", "--no-modify-path"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry --version").chomp
  end
end
