class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.23.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.23.0/sentry-darwin-arm64.gz"
      sha256 "348d08dcef3ee8453eeb710fa76976c9f97de7c0f0feaeb458ef7ff7a3920a6d"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.23.0/sentry-darwin-x64.gz"
      sha256 "819201026c284306a1fd9202cef6f4f5e78860a1cded5bedb061f44b1195d2c8"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.23.0/sentry-linux-arm64.gz"
      sha256 "45e0dbb8599c01be8b1d1b2001fc3cbd1e2fa8ec90aa72e846bff7662926619a"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.23.0/sentry-linux-x64.gz"
      sha256 "5df89a9f853de437d460a08a843b49b2f99fb4cca7bc67ff9ddef4d837cdf77d"
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
