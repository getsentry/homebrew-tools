class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.2.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.2.0/craft-darwin-arm64.gz"
      sha256 "8197478276c7871fd2f00f20599b9e413bc49a7b1b5c2c2a48b661365366e114"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.2.0/craft-darwin-x64.gz"
      sha256 "f910db962454c2e8debb4915be9f20212fad8416a68cc4047d1e7311bc756379"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.2.0/craft-linux-arm64.gz"
      sha256 "10c53e6cc074cf8e51967bf3db2d81d549de3673f81ab8835282f9cf05de0a66"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.2.0/craft-linux-x64.gz"
      sha256 "fcbd0bcf8502a4d9ae82790dd134abcd2d47963bfa5086f9cf6f5959806bf6af"
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
