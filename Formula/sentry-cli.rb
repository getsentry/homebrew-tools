class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.42.5-alpha"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5-alpha/sentry-cli-Darwin-universal"
    sha256 "75897bd9454eab515af4c6d5755b3129bff61dce6f1cd65c4beda8bbfb4c2f09"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5-alpha/sentry-cli-Linux-aarch64"
        sha256 "45443b5d81d7e3b15649cfb2d16425ef3f3a4517177c8f5dc91b3319f5afb500"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5-alpha/sentry-cli-Linux-armv7"
        sha256 "0517c29c0ce867036651b538b6153ca7b5102b2270226f5fbec6b4aef802d30d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5-alpha/sentry-cli-Linux-x86_64"
        sha256 "684359e6bce735f6be6ab5059aea8549ffbe789fa5daf924137f3e90e316c0b1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5-alpha/sentry-cli-Linux-i686"
        sha256 "91a6c3eae40558fe66ea8966dc9d176b97cf0e7644c00e2a5ce8d6fe9f118571"
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
