class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.0.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.0.0/craft-darwin-arm64.gz"
      sha256 "b9c39a2e776baa46c83f662b8b7f12599d81e4f92d89eeb7c0c9770c0bb2fb1b"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.0.0/craft-darwin-x64.gz"
      sha256 "b2f3d1f4563f6a83a373587b88fb90da50615429db77f27ebc7cb61011b49dbb"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.0.0/craft-linux-arm64.gz"
      sha256 "6e62decb1861ec5c1a09250fc376067d3792d6fbb34ae10681088967f26f370f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.0.0/craft-linux-x64.gz"
      sha256 "fcf9f280f0c601531efa98bc997ee1f9e55c68b6cdc1e8f06e1124e61d3e67d6"
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
