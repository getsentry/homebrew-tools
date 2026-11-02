class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.7.1"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.7.1/craft-darwin-arm64.gz"
      sha256 "bd455b2f6bad6b5504704bb9ab0ebbdf6d8ed2a45c368c89514ad9d1f1832e8e"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.7.1/craft-darwin-x64.gz"
      sha256 "5f5110106f8bc049be567affed3ad97cdf440b9f9dfd9c92ae00b0166b8907d7"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.7.1/craft-linux-arm64.gz"
      sha256 "b94e3d22e924b53ec5fdae15f8ba98af2186acc24c91331179cbe562a6db4950"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.7.1/craft-linux-x64.gz"
      sha256 "0352913c3a33916468c4da83ab541086dd8d8a23a310219a1c91cd101ed99cba"
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
