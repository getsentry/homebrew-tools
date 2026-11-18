class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.13.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.13.0/craft-darwin-arm64.gz"
      sha256 "88d04ea1c6d9e1476eb227d891f11ed71d612c0b8af7daed100fc4102f045100"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.13.0/craft-darwin-x64.gz"
      sha256 "4d1bd527432f605c3d588f08e4f1c6a1928dc7f699d966618407bdb53c45376e"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.13.0/craft-linux-arm64.gz"
      sha256 "ff0788779c11a4a2edaa7b8467a303f1ca4aea380cf32e9d2ecd0895f91170bc"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.13.0/craft-linux-x64.gz"
      sha256 "f33b980ac25f11f9e7b203cdf122e4bb72f5612f96521a69bd0d610007fc4660"
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
