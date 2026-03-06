class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.15.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.15.0/sentry-darwin-arm64.gz"
      sha256 "a1c4c3c288ac955d44902acd9f0b49c0ba020bcd70b410c4fa93cbe9c082ada0"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.15.0/sentry-darwin-x64.gz"
      sha256 "7da8d0f7cf92aef9bf99715da1816ac4f2e930d6105d7c30d9ed87ccdc1bec97"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.15.0/sentry-linux-arm64.gz"
      sha256 "7e6bdd7a4e40874933099a2ad310d96c6054927047f7ea85cc598608f9872116"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.15.0/sentry-linux-x64.gz"
      sha256 "3105104a039a8662abe44062e76e17be80425b67c2b6b681790a380d695c4d47"
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
