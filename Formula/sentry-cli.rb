class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.19.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.19.3/sentry-cli-Darwin-universal"
    sha256 "31ad824af72d68eb972adea20598b58f751d4f416ea74f75e83653ff0042e59e"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.3/sentry-cli-Linux-aarch64"
        sha256 "37b994950280aa4e0777b6d11ada699a5a8c51a1f321a8b3444f36d4bce4a5b4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.3/sentry-cli-Linux-armv7"
        sha256 "5fb865b203682343b7985b8c41c76d29cee95aa5d29538f966926f0203473789"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.3/sentry-cli-Linux-x86_64"
        sha256 "1cf2c1ab70ec0ba59c5a7fad317e22b4a5ac95fe03ea9b2361c1c165f0d597da"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.3/sentry-cli-Linux-i686"
        sha256 "ac8c64e87d93990c6176ef0dabc116d3e76034a8ccab28e24924a5699b1e0b55"
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
