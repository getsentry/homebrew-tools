class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.14.1"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.14.1/craft-darwin-arm64.gz"
      sha256 "a7076cb78212046a59a2ef9206a575cb349a638df9809b145f7437eb1cb31440"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.14.1/craft-darwin-x64.gz"
      sha256 "a12323570fb678e68c3f2e991ece3d6200d66cc1964e04b9f4482ffbec58e9ea"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.14.1/craft-linux-arm64.gz"
      sha256 "994024b9a9b8acd8910bfb15cc7e7f5923c9221d41cf70a69d8191cf9fefc11f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.14.1/craft-linux-x64.gz"
      sha256 "b19ae58f6d4ac5d58fbb79dd48dd3d20b75f629419212bc72009c54acf14437c"
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
