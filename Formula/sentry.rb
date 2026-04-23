class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.29.1"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.29.1/sentry-darwin-arm64.gz"
      sha256 "fc844b6ab6b2553eaaa83f05872ace7710e84826a8427b0e0ceb287825baeabd"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.29.1/sentry-darwin-x64.gz"
      sha256 "268092a0564399dff33615d4a0281b8260f23c11852c6713e7b8bf8568ae3c4b"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.29.1/sentry-linux-arm64.gz"
      sha256 "cbcadbb1ca86dea46e9b58783938dda073df57642a98e9815e492a03fe1adfaf"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.29.1/sentry-linux-x64.gz"
      sha256 "da97b6fd26c1932b5062dc6bd2d1800d2617faffa5f1957d42be0873d0828d35"
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
