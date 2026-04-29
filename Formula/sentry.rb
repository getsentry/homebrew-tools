class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.30.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.30.0/sentry-darwin-arm64.gz"
      sha256 "a586391f916467d9022996db8c610b2aa34cc63eee58f5fd6ec472b5b3f260e7"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.30.0/sentry-darwin-x64.gz"
      sha256 "ecc046f2555d7465906282b758f2a8b9c5aaa20dcd082d2c45781fbf43e7b152"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.30.0/sentry-linux-arm64.gz"
      sha256 "496f6e50fa8f79dab783a22e2cfc71cf75f1bc6eaf4a7154972df03cb6ebf3d0"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.30.0/sentry-linux-x64.gz"
      sha256 "435a500e885b63b129ccc34b32a2c996f4530ad98f14c65c173bdeab6be380fb"
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
