class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.12.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.12.0/craft-darwin-arm64.gz"
      sha256 "58e712fb8d1dda801a1de18e555ef201c54d02e4f9f52434e2a3b471c6eb39ab"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.12.0/craft-darwin-x64.gz"
      sha256 "fccc9d7243c459553636ed955bc608484c7e7dfa484b7c9636e4ea6f8a8c5ba1"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.12.0/craft-linux-arm64.gz"
      sha256 "d83fd93e74bd47def0e803b668c6199319c0a92a672271033683e70937f3df93"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.12.0/craft-linux-x64.gz"
      sha256 "249d50d9e173c94f0ae75a73ea28b2f1a9c872a477a53d0249ff62a6b546434d"
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
