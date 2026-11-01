class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.6.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.6.0/craft-darwin-arm64.gz"
      sha256 "14a6dda85a10b0955ebf7825a94d5aac6bff85bf4c49e201551800d75cff98aa"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.6.0/craft-darwin-x64.gz"
      sha256 "ab4eaddd8cc352788a93e80289ae97e9f910082cd084e72d46cd6ecb2eec9973"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.6.0/craft-linux-arm64.gz"
      sha256 "7b75c3095178d002debc6b8d09fde9732ef168e75c07c345c7283d0d2ec407d3"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.6.0/craft-linux-x64.gz"
      sha256 "eb5cbaf7716c4ed874d83073ad69368055167003d40ab49b76242c037e6ddc8b"
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
