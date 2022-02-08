class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.72.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.72.2/sentry-cli-Darwin-universal"
    sha256 "de3334f1686c0cd492354b0feac4e6e3990aa49c5bacd9a84254b1b2e50525f7"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.2/sentry-cli-Linux-aarch64"
        sha256 "b953a6f22d8cbb4fbaf9a4d35017fa406cb304eecbc4867f6f5974a4a218c5db"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.2/sentry-cli-Linux-armv7"
        sha256 "b4def6dcf17529af23354ae2212e5cf77619b14eaa2dde4f4f707884d6766880"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.2/sentry-cli-Linux-x86_64"
        sha256 "f2c29117f46868849b7095ee877a1c813a80c6e218d19ad7dc6c5cae592f30a6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.72.2/sentry-cli-Linux-i686"
        sha256 "95c807d1fb77ea6816a30c9e0c38e93ddf4704c2462581198c1f483436b0caf5"
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
