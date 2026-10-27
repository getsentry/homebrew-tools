class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.3.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.3.0/craft-darwin-arm64.gz"
      sha256 "9226c2f7c2c856163b305aef5725a1631a9bcf05f72abe28bb399873c80387a8"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.3.0/craft-darwin-x64.gz"
      sha256 "ba1fa661d15a395f33078b7cf4b194d45e6780ce00e4f52ff1e5c77762ca85eb"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.3.0/craft-linux-arm64.gz"
      sha256 "e7794b9e02a3e969282ac8be8c0971e0abe68d7fbf8c518e352bbdfcf0f24461"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.3.0/craft-linux-x64.gz"
      sha256 "957db5d1e90e922897ca0b3b055c6053e8e2426c4ba9d8e217c57901297d1e05"
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
