class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.36.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.36.0/sentry-darwin-arm64.gz"
      sha256 "27ded0b3ee684f6029c09c63f29ddf9d3d60311717d812f1a2d24c1456bfaafa"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.36.0/sentry-darwin-x64.gz"
      sha256 "ba87241f35fb5b5462a3cab492f61583febd9f9c2ce076936e1d89c2f031bc57"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.36.0/sentry-linux-arm64.gz"
      sha256 "59dee5b077ac8a606ca4b11461691ed541a73a113738e40c163f144cc6b462b0"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.36.0/sentry-linux-x64.gz"
      sha256 "05d68392a247af054c8d7dc27fd068c2428ea7d9c8672a2badb26daab83a5edb"
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
