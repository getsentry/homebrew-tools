class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.28.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.28.0/sentry-darwin-arm64.gz"
      sha256 "93cacded31d00b6a955ca824d0c1fd3cecbebfdbd1113cbd8cb661dc80a78d5e"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.28.0/sentry-darwin-x64.gz"
      sha256 "f38e2001b50d0866a3fc65ba21253bb09780f8b7dacfc976c222a4723671baf0"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.28.0/sentry-linux-arm64.gz"
      sha256 "01a0cd772b166e8aaa93757a23e564440faf80326ac098667f633074ea646e8a"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.28.0/sentry-linux-x64.gz"
      sha256 "94d4a0ccbc0c7a342fec3c008e6ab5a7c5402adb845d1bb998edcffa2fee0e03"
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
