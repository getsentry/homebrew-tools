class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.17.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.17.3/sentry-cli-Darwin-universal"
    sha256 "1dd232fb2bb3f748b57a812969755d82caef95274b0a7992adb683d867115052"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.3/sentry-cli-Linux-aarch64"
        sha256 "54f140230958c142a686f342931a710f8370cf4e5e29e3ac9eaa62a1acd0db21"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.3/sentry-cli-Linux-armv7"
        sha256 "7da43a5f9525d48ec9b73fe883ba73199ee9c03446e21228761c6e6103be99b6"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.3/sentry-cli-Linux-x86_64"
        sha256 "f4433381f4dae424ffad88a40f863f7ed66c450f37038e0673e30adf8e1f7040"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.3/sentry-cli-Linux-i686"
        sha256 "0b14c34b0b0dd72b3f42cdcd9cba51775ebd93233b90002f25fe17057ca2018d"
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
