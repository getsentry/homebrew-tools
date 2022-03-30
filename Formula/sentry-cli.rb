class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.74.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.74.3/sentry-cli-Darwin-universal"
    sha256 "ec665920219317a728093b30fd9c009dd64a8f49001d1d8434a46aa8ba5d0f12"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.3/sentry-cli-Linux-aarch64"
        sha256 "5f981d63bf6644973b85cf514381196b7a7089fec07e580be7530522728cf95f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.3/sentry-cli-Linux-armv7"
        sha256 "c852fd2e1f402c3db0b269df17da7d14e8098c1c066ee09d342901c39862a36a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.3/sentry-cli-Linux-x86_64"
        sha256 "2d2b4acc6bb644aef5d07bd8c96ffaa16207719355fbf1578833c6eeee912554"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.3/sentry-cli-Linux-i686"
        sha256 "f1db03614ec2b15e9cafcd7f3f7a9aaee5291f420fe4981ea220dc1bb8ec479e"
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
