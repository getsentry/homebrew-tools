class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.45.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.45.0/sentry-darwin-arm64.gz"
      sha256 "106c82468058c6103121781d9fcb00e0a1d93cc0be2b828d4e3ee0db7d6bec68"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.45.0/sentry-darwin-x64.gz"
      sha256 "bd89aa3d5acdc925fd702bea990e634b1cb37aabf5e1837c74757cb840a5cb55"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.45.0/sentry-linux-arm64.gz"
      sha256 "15da331a11738e51f0347b4a387300372b31330ac824b3ce281b6693fe0a2692"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.45.0/sentry-linux-x64.gz"
      sha256 "f15803939b6fee8496fc5673988d2104af845f328da5244beed61c8b75ba2ec5"
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
