class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.7.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.7.0/sentry-cli-Darwin-universal"
    sha256 "a757a3700bcb16c16485f15d0a187c12ac1edd40b4aa29f5cb955f9a4fa9ae96"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.7.0/sentry-cli-Linux-aarch64"
        sha256 "9908b947a7a2c393e8c115665d972fbe3eb67e540b1ee0b07fedce78e7a712cf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.7.0/sentry-cli-Linux-armv7"
        sha256 "0f240f47f6b38a3b7c4025cd3d4e53c746e9b6a05f210ecd7d41bc09512e0b77"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.7.0/sentry-cli-Linux-x86_64"
        sha256 "6a57a418b34c5ad71b5dddc73b8d63b5662b8a11713ac0d92377b64976507d82"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.7.0/sentry-cli-Linux-i686"
        sha256 "dc08351e062a2d30309cb1f94173f79b2b7cf2e23d122adbfbdd71a1afb88d9c"
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
