class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.26.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.26.0/sentry-darwin-arm64.gz"
      sha256 "134cc1c38a9d190082143b0feb6647aa4556a7aabac75f8625e76bfede4ca7e5"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.26.0/sentry-darwin-x64.gz"
      sha256 "c3d76111af6f20b0a2912e108ca64ae6b07479a3731fba07a54159abd5a2a66c"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.26.0/sentry-linux-arm64.gz"
      sha256 "de6542c7f80dd97c1516217f409e850d010255482e0a535aebeb8422988ab13d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.26.0/sentry-linux-x64.gz"
      sha256 "67ef9a7cb559d8d7200c734a025e709e62230d827df44da22ff3ec15587ad001"
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
