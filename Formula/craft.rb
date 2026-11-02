class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.7.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.7.0/craft-darwin-arm64.gz"
      sha256 "a2cd8ff43b2835422ebd4ddb9df5716dd1a3be19417a6bb5584f6681cb35230a"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.7.0/craft-darwin-x64.gz"
      sha256 "0331494c7e0d898a43df82e9f8ec0c856afb900a71fde457b2f77de185ec8dd1"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.7.0/craft-linux-arm64.gz"
      sha256 "f2caee34d372d49339a91e3661652a4f3e6d566c280b1a5b21eeffd579cdcb86"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.7.0/craft-linux-x64.gz"
      sha256 "564c9ee3f0ba284633bf980a824c0a94bf4ddefd032a3bda60dc2b18f37edcd2"
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
