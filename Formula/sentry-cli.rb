class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.3.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.3.0/sentry-cli-Darwin-universal"
    sha256 "dcede3b42632886a32753ad9d763f785d46afd5fa4580b5c979aad2d465d1cf5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.0/sentry-cli-Linux-aarch64"
        sha256 "66ac0b802e82fcef7610dc29559f18efc1eef67bf9610a19705a844ed0697dd4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.0/sentry-cli-Linux-armv7"
        sha256 "82f55fbaa54ba7b0a3ec1104560333bdd01897feb75ba323ae4e68de93ad4d61"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.0/sentry-cli-Linux-x86_64"
        sha256 "5563b71cc28cd8b1e2cd1037f8e377083992ec112c9bf1ff0efd26dfe3b1e67e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.0/sentry-cli-Linux-i686"
        sha256 "37dd336b6545e557d1e7bcba46f53c37f96108036420578042434d396d67417a"
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
