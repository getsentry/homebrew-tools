class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.11.1"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.11.1/craft-darwin-arm64.gz"
      sha256 "9e9327fb6d692db73b23053f77ec1f5fd871f0ea0ee21efbb3316f0e78bf8ab7"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.11.1/craft-darwin-x64.gz"
      sha256 "d437d2aa93c9ecf4b5c7de02c3a81052c30ac38e942d8c0cbad17ff955aa66ee"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.11.1/craft-linux-arm64.gz"
      sha256 "e753b40024eef3c191fe36cc19c44de3f88443b5f1dd4e3f31109d7bf0ea5a5f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.11.1/craft-linux-x64.gz"
      sha256 "8c478a44ed642fecfdb198d8a7aa58fcbe8e6ca0c3d107f20340d0ac9660833e"
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
