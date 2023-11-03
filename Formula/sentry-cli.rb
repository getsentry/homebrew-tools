class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.76.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.76.0/sentry-cli-Darwin-universal"
    sha256 "1fb8038738889e8afc6b9b24dc388ced67b98bb3153566e347a04965f5f4074a"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.76.0/sentry-cli-Linux-aarch64"
        sha256 "bca2a0d97a0deb7f5cb98d47e1b448ffdefe61a1956b41d8cda6730125eced37"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.76.0/sentry-cli-Linux-armv7"
        sha256 "ed818dc2705fcbdb6db24d04b4ecfd42a9cc7b1580f19bd8b5705cb53e5d69cd"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.76.0/sentry-cli-Linux-x86_64"
        sha256 "e19d1e542fe97e711f5d7bb646289f441c4dc08ff92c3937e5289e9fcbfc72e6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.76.0/sentry-cli-Linux-i686"
        sha256 "b085e3e867b25afee4cf780348ebfdbff724da5a785046083fba8c893b274093"
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
