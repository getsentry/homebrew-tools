class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.77.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.77.0/sentry-cli-Darwin-universal"
    sha256 "56973c245b5288de36d3fcb3420d67dc7f04e26c2c1cd35379ce617491f1d837"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.0/sentry-cli-Linux-aarch64"
        sha256 "629e731a9dd2e925934eeab5e33f02ba2b60e8c2224b95321ab117a775ed6861"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.0/sentry-cli-Linux-armv7"
        sha256 "a8fbf4543d42372743ee8bc0ea7b43cb60b78d3e260d355ad4855c3bacf53f5c"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.0/sentry-cli-Linux-x86_64"
        sha256 "55fe5bdd1112bd6ff625df8cf97aca3e61df52293ab5b7d8f7466f334298bb27"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.0/sentry-cli-Linux-i686"
        sha256 "9b8982a2ebec0ba0b6199e070362f26e916e79e7d923cf2615f0af85afd1171b"
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
