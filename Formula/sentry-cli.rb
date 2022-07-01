class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.3.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.3.0/sentry-cli-Darwin-universal"
    sha256 "64daf76a3611e75440326f47064f7d2ed6eb726e69315bf4ed3ff263fd496617"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.0/sentry-cli-Linux-aarch64"
        sha256 "826359cc670730361ab444248a922e6276c61801ebdd5c4634107388d8e64cab"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.0/sentry-cli-Linux-armv7"
        sha256 "7d83ba9e473b4bfda92ff3770d58a09820bb2649c824797b236b8d2fa3f4997f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.0/sentry-cli-Linux-x86_64"
        sha256 "900fb305c6122a3e99671d62f64c99c91f74fc2f30bec802e668820493e30fb0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.3.0/sentry-cli-Linux-i686"
        sha256 "bf7c5ebf8d173831932a4be1627431076f0f625df2056598c98b37dd5c6fa753"
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
