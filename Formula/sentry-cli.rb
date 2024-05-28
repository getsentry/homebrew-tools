class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.32.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.32.0/sentry-cli-Darwin-universal"
    sha256 "f153c45780f276bfbb6ef04c9f1845019e443fbc558a6f9e8d754fbd3eeefd8d"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.0/sentry-cli-Linux-aarch64"
        sha256 "a6b4f68e168ceb66e15688e5785c3271a5307931548740212c1e36bed7c6eb16"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.0/sentry-cli-Linux-armv7"
        sha256 "5ea60ec4e4f82c982e1e108f6279efe9f6f91aa5284ef9e43b12935f6b0922bb"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.0/sentry-cli-Linux-x86_64"
        sha256 "722067e1658c9fe40107d1e65b2efb78e991d6495ae1e476f89c5fd66b2f748a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.0/sentry-cli-Linux-i686"
        sha256 "ffc833eca2bf3ffc71e870c8208e0c29c58d8b0c6988cf77aebff17a98475002"
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
