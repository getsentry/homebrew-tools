class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.42.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.42.0/sentry-darwin-arm64.gz"
      sha256 "3008dc007e62215abaa0e6acd52d8ca18e5e477634826ad7ff08c3ec05f66115"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.42.0/sentry-darwin-x64.gz"
      sha256 "0eb94fc899e63191e59985fa0da271ccda4067d0ab95a39b7ca84fddd965dbbf"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.42.0/sentry-linux-arm64.gz"
      sha256 "ab4e9e86c98cd6ef60aae44d134f2210f949f2f3819da74bb3c7643ae6bfc974"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.42.0/sentry-linux-x64.gz"
      sha256 "196f8851032d5d64781571032798fa9df19d8817ce4169bcae51cb4c258e7b30"
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
