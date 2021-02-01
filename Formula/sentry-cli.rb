class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.62.0"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.62.0/sentry-cli-Darwin-universal"
    sha256 "56e5848c5ce08ef54b9853ad1fcd7c350c7115249489a106b8d49e4f6dc28c63"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.62.0/sentry-cli-Linux-x86_64"
    sha256 "574ae79c5479e0cda1bcf60051f321551bf2699bae62b3c5ce4aeca96d7bacbc"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.62.0/sentry-cli-Linux-i686"
    sha256 "c386590cf9eeb7c04ad08ad9fa8fffa801988536ba2c311a8a6e69241da9fc09"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
