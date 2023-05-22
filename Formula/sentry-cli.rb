class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.18.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.18.1/sentry-cli-Darwin-universal"
    sha256 "1b9c0b9e1156ac134654838267d63fac03e190b6fbaed1bd93fa09e2467806c1"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.1/sentry-cli-Linux-aarch64"
        sha256 "1e85b33e06706274cba807627cf7d57960e13d90aa9a8a529c241665591f6a00"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.1/sentry-cli-Linux-armv7"
        sha256 "bebcbd94e1f54bc8763c8ecc0d6826c3b8a4144a23bbc770ff6f780015ce869a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.1/sentry-cli-Linux-x86_64"
        sha256 "551d26ad4067b82e7a63139c4898f4d5294112746fcd7f0c7e61d08dff37ea33"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.1/sentry-cli-Linux-i686"
        sha256 "152547d8e93d1fd3c06f03d640e056261f908195014ccc9cb5592d3911342260"
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
