class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.43.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.43.1/sentry-cli-Darwin-universal"
    sha256 "431ed8b2234a222b03734a2aa1fe2347fa81f8410e51202d632c2e494f277670"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.1/sentry-cli-Linux-aarch64"
        sha256 "88fb060ef75f668dd60400948907ae980e7f41aa0c50459627769a3979b08dfd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.1/sentry-cli-Linux-armv7"
        sha256 "ef5a2e53a003d8f9af151d3f03e93f62ccb1b14b5ad98f7662ae975b693e6b05"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.1/sentry-cli-Linux-x86_64"
        sha256 "5b905d5a94e88bab5237a92e309070dc0cf832f76ff7eef0abb4ace3eaf084ad"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.1/sentry-cli-Linux-i686"
        sha256 "1815cdf66bfa69a2a365bf0dde99307cf767c62ab09729490e093d31b597d209"
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
