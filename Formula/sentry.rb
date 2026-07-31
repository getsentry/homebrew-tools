class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.40.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.40.0/sentry-darwin-arm64.gz"
      sha256 "2792a6a90779db35b597901d6ceabe325907d65499ff380d8184039cb18d6da5"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.40.0/sentry-darwin-x64.gz"
      sha256 "35a6cd5882a7c228d30782fecd3161aa41df8f38ef7f423909e523a0b295587f"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.40.0/sentry-linux-arm64.gz"
      sha256 "329ae081155e9f9065a56ead83feab3a88aaaede591098aef995785aaf169de1"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.40.0/sentry-linux-x64.gz"
      sha256 "9fe5fceda173a595d041480355d432d9fbc495ca4ba27c196db9a9d50b4c5c81"
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
