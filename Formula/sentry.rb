class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.14.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.14.0/sentry-darwin-arm64.gz"
      sha256 "94ec2004798c24fe4df3e607297eec893fe457cac7e170c594695141e43063df"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.14.0/sentry-darwin-x64.gz"
      sha256 "c232c93cb3d0156aa1e8646d4803e0a5fdccbdeba3b370346901c993d4662f16"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.14.0/sentry-linux-arm64.gz"
      sha256 "5fc00061a9ba0ae662e18307565c62392815f0055f4e71d8ac285471765943da"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.14.0/sentry-linux-x64.gz"
      sha256 "cfe7a81351c57ec947481a58262197d7fbe960be8f881106e355d8f5b79abfc6"
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
