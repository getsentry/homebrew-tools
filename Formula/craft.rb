class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.12.2"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.12.2/craft-darwin-arm64.gz"
      sha256 "90eedc73ea19b383043afacffe312492ad9158848ef1f8ce51f357c0f4d1dc04"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.12.2/craft-darwin-x64.gz"
      sha256 "a38fa5303f29c4560eae71a92f838c3160624207550e2683845cf13a4effcee0"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.12.2/craft-linux-arm64.gz"
      sha256 "224ae8974958e1363b3aa0a73393da391720bf417a2e6316ff8227530aa0e5e2"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.12.2/craft-linux-x64.gz"
      sha256 "be8b152befd3b4a254a7515e4b4fac24ac81789edeeb541d73d46ed1c1b609a2"
    else
      raise "Unsupported Linux CPU architecture"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["craft-*"].first => "craft"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/craft --version").chomp
  end
end
