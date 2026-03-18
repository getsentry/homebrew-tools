class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.18.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.18.0/sentry-darwin-arm64.gz"
      sha256 "e827354903f2a03921cc53570e7b978d16c709e02841b4a6a4472a5c01405650"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.18.0/sentry-darwin-x64.gz"
      sha256 "a2b160fd920919b7649aae57630b308322c9deade994a98c4b61e2273d11006c"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.18.0/sentry-linux-arm64.gz"
      sha256 "afbdb1738e4b7ca0d52e545386512357b16c00cca5d7c26720d9be66e17913fd"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.18.0/sentry-linux-x64.gz"
      sha256 "990ebf897924e5d7d6e4ebefa9540079d323d0198e8775e791b2bed5f0c56025"
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
