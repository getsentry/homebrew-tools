class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.34.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.34.0/sentry-darwin-arm64.gz"
      sha256 "9fb7201293f0f6ec7d539af5c6ae19a613e2ddcb0850c3bffe1eb33ae6ccf6f7"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.34.0/sentry-darwin-x64.gz"
      sha256 "09c387ed363036a8e9711d18d35258f8419efb61711d99b8a08f26710bed6165"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.34.0/sentry-linux-arm64.gz"
      sha256 "fd39b0ee590cd3f94fd1121e71a43c4cd621d166119b5bc59d50dad19d291560"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.34.0/sentry-linux-x64.gz"
      sha256 "f8554a004a7d234549eccc7f320482995d1ae749d19e7862e3552930ce8ad5f5"
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
