class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.73.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.73.0/sentry-cli-Darwin-universal"
    sha256 "392fdfa1af128420a513de98e596b83c08e7242be4f3435e6f2b9665dec15811"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.0/sentry-cli-Linux-aarch64"
        sha256 "9ae2a36e491dfea3b6c113ec5084680867a361a58671e21eb163fa553a8dde15"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.0/sentry-cli-Linux-armv7"
        sha256 "5b3f36babcc10c232783ec76f48eac9a8ec2a77db7626604127799c2f445c73f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.0/sentry-cli-Linux-x86_64"
        sha256 "ad9b2a8caf3f05cfc51024a9d10650dbffaa005abd8f407801f318c4924d366d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.0/sentry-cli-Linux-i686"
        sha256 "90eaf2f259999becdf2d127489c71b2c33952b0c67f13215306abecbdf893ddd"
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
