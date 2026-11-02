class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.8.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.8.0/craft-darwin-arm64.gz"
      sha256 "7b00e419c9541858c567bcfab1b3353afcf4ed8808c40760b06855cdb6701ee7"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.8.0/craft-darwin-x64.gz"
      sha256 "e6b1f24bcd3da41def351f6e71c1d3ad7f5f6469ab6e64539208608dbc5e1ada"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.8.0/craft-linux-arm64.gz"
      sha256 "cfaf3eae243cf36527605171d8eb65dc91ed6ad7a70cecc462d04c656aa0fbe4"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.8.0/craft-linux-x64.gz"
      sha256 "2e4c040e03732abbcb198b5bdffaf0916bf4ce18c947e3683890a29425a64cf8"
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
