class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.3/sentry-cli-Darwin-universal"
    sha256 "4c445c18711539740e53dfc7282b8fe905aa013a804d6eb6318950ee1447f199"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.3/sentry-cli-Linux-aarch64"
        sha256 "fae5777deee53329b8c427fb9eda86bd4f01412b73d0d672b9485e6f95be0247"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.3/sentry-cli-Linux-armv7"
        sha256 "7f40080ff5c54d06d0a7674d4172a78fbc99052238902eac097be5a17c1f4283"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.3/sentry-cli-Linux-x86_64"
        sha256 "f2d4eb5a5d338278b7c38d5fa16a33026602827c6fac5cdb7b35b909c91de001"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.3/sentry-cli-Linux-i686"
        sha256 "b9e36903099d050892a977f5490a5a92dc43907b39331e291cec49270e47d56a"
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
