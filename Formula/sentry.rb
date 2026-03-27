class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.22.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.22.0/sentry-darwin-arm64.gz"
      sha256 "c318ab24a078007097a82b9a9ccacdcef289270b3cbceedb40f52a50b3bd5816"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.22.0/sentry-darwin-x64.gz"
      sha256 "cb217d45a30809c83a9ed7a684865a2fe47fda467e6d3c37d43b0f7ec64764d7"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.22.0/sentry-linux-arm64.gz"
      sha256 "8147f3f891c549904308b99e9db06d69325fed4a417e970af40a42ee10b0096b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.22.0/sentry-linux-x64.gz"
      sha256 "f4e7d11da32eb410775494da78c717a0cca01d2a9fba3e725323511eef63ab2a"
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
