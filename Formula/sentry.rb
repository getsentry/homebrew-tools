class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.24.1"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.24.1/sentry-darwin-arm64.gz"
      sha256 "f608ee9a3b516a1f768851fc0b76615e94cf9164f0356a82f07f8bb937beb170"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.24.1/sentry-darwin-x64.gz"
      sha256 "8f5864dc4bd98980c1de756253e461ab0e51eb2043c5bf1ffdaf3fe92f997e9d"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.24.1/sentry-linux-arm64.gz"
      sha256 "5ae7ef10733154ee4dceae103809a20324ca256c6843709f19de9eff00809367"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.24.1/sentry-linux-x64.gz"
      sha256 "3b05d19f239552203fd78fb671727e53311666619b23b4e3984465a6c2ae76ad"
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
