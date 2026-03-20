class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.19.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.19.0/sentry-darwin-arm64.gz"
      sha256 "86eece8ed0b50b2c1d223629e341ec3a811a7f31bb6dbf6e5bc00108dcac65f7"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.19.0/sentry-darwin-x64.gz"
      sha256 "7bf894b4fe76b153c054753964924b99e8225ac5d3dc7c3f395ceb441aab2535"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.19.0/sentry-linux-arm64.gz"
      sha256 "c2737e348b42e5a52df2929665cbb1214436d98a42d8b6d99fbf68222b593909"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.19.0/sentry-linux-x64.gz"
      sha256 "9bd06980d171ec5899d42ce930fac3e18fff0f18fe60e0ef6f29ed68b797254c"
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
