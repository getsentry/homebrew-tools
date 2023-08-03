class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.4/sentry-cli-Darwin-universal"
    sha256 "ad5a51b825690306382a824c905ae9d30ddf34a352255565caa017368d8b08b5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.4/sentry-cli-Linux-aarch64"
        sha256 "0c67bc6edd8d3c205980a5082c549099f8d84eed0516028dcdcddbdf1d20d9a7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.4/sentry-cli-Linux-armv7"
        sha256 "68113c5ce7cd2bf18e0694f97468796e5451d5755f7ca568d5767ab8c60f8fd3"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.4/sentry-cli-Linux-x86_64"
        sha256 "dde8e494a4178143417a2a208559493ad7954be2a6aecf2195c21d36468b53a1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.4/sentry-cli-Linux-i686"
        sha256 "24bf81e4ff3ed71af756d1a6ade905f9a885a91bfccf7160c458651798caa491"
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
