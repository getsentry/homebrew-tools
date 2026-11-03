class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.9.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.9.0/craft-darwin-arm64.gz"
      sha256 "2ea106e0a09fa8d986de64a979504b237ada584bbadc4da8ba3d14fdbfea2131"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.9.0/craft-darwin-x64.gz"
      sha256 "b1234dfbcd9eeff62258e24ed1aa93bc22442e0ef4326e156778b0f9647a9c40"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.9.0/craft-linux-arm64.gz"
      sha256 "cf5e33ad4875eff37fe87654e1b05fcb681e6bb91ce0f1c4df15cff1a8ed559d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.9.0/craft-linux-x64.gz"
      sha256 "72d4563419dc777ac6017cac620b11f5f27bf4b8b8db4095f68be960f532323b"
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
