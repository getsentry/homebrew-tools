class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.17.5"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.17.5/sentry-cli-Darwin-universal"
    sha256 "7586993d8a686dfb3e42f81075e6cc44cfcc8e6b07b207b5e067a26e914c58a3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.5/sentry-cli-Linux-aarch64"
        sha256 "2071c03f870fcce6f9e82cefcff004e92f6d1af250a31d157ba921c671a5f9ec"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.5/sentry-cli-Linux-armv7"
        sha256 "260c4dfc70a398d4c9993b5c51fe8eb44200cbbe2cdfc0cfedaf7980fe21ee11"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.5/sentry-cli-Linux-x86_64"
        sha256 "8200b8f0831535d5c21adfde947ca6d30930619eae36a650cbcf1005c68cd6dd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.5/sentry-cli-Linux-i686"
        sha256 "142824382e394f06a1a9b0bcb2276dd29fed17310fc01a24706724e6979749ff"
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
