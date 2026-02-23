class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.2.2"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.2.2/sentry-cli-Darwin-universal"
    sha256 "8c728e413c44550d4930fc981490c8f310097a428d118feb2f2688c03c0bb377"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.2/sentry-cli-Linux-aarch64"
        sha256 "06d6498e48eb7c39dbf848a341689eb16ef646eace29d39fd0e4136c637b36a1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.2/sentry-cli-Linux-armv7"
        sha256 "4f0b17c1706c9402388cc8fd8cc19e2530b399a57f068277eb67df9e64633735"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.2/sentry-cli-Linux-x86_64"
        sha256 "ec5987dc83ce601fb99bbc43abbc5623832ea507c13ee13f9eab62bf77d3e55e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.2/sentry-cli-Linux-i686"
        sha256 "895c8b5c4e15f25070fcd2fc0ab88b8a90c575a41e45bbbd1613d97604b2360f"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
