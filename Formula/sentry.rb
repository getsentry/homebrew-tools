class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.25.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.25.0/sentry-darwin-arm64.gz"
      sha256 "a243ef14aec6b84ef4f9bd75026b0be3071551ad0cadc3669d343e1ac8c643fc"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.25.0/sentry-darwin-x64.gz"
      sha256 "be7a6c57327bf63bd201942a0845f1970622ea43d194603876de661490251d21"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.25.0/sentry-linux-arm64.gz"
      sha256 "06d3d9b98eec181caa28938bbf065a2afc57ecc4c1c562a085099685869969ca"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.25.0/sentry-linux-x64.gz"
      sha256 "a6205314f5d7a20859f392bcd249246c6c05a1c3d2607e808fd2d4b8eb0a3676"
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
