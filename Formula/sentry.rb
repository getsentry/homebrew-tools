class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.47.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.47.0/sentry-darwin-arm64.gz"
      sha256 "d4a3bfb7d85c180eee816e13859b821a69587ac6013ba512ad54d34535aebc11"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.47.0/sentry-darwin-x64.gz"
      sha256 "b6abb1e982c57d074cad680432baf95278facb14aa9c651fe4890222ddd583ff"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.47.0/sentry-linux-arm64.gz"
      sha256 "8015cf1ba3ca99b9404471ef64f68df7764edff7211e996e5f64362ddd97e621"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.47.0/sentry-linux-x64.gz"
      sha256 "ca621e07ce141f8c172e1da88962cbd8b9a6c204eaec3416a5cf8cad6b6b3ad8"
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
