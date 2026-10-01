class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.46.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.46.0/sentry-darwin-arm64.gz"
      sha256 "c2931e15c9e4446b9b2e7d8a823aaaee97cf84443ffd5d9c72372d32aaf9a744"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.46.0/sentry-darwin-x64.gz"
      sha256 "0332cbb0ff03c87f923a4e9a899d64486dc4e00eb8fef43cd4bf6674d9bd477a"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.46.0/sentry-linux-arm64.gz"
      sha256 "e9205f540d1a809bfbf2f47df20649c2a184ebc63be14b6900105050c90bd40c"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.46.0/sentry-linux-x64.gz"
      sha256 "e68166605de3691d648bd92e6033a2ae19d36b61c98f14e1d277bb8d9a32ac34"
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
