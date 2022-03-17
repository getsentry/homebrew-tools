class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.74.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.74.2/sentry-cli-Darwin-universal"
    sha256 "a4023a9ff8c79d73d81ff577299a5fb406676612bbdd95d02ffd76dd69966124"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.2/sentry-cli-Linux-aarch64"
        sha256 "f383d1b8197ebb8a129f3b2c80614d319cafd215d452c90868f6d71aa66f8a1c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.2/sentry-cli-Linux-armv7"
        sha256 "ffea267165b98d0b43a1ccd4609e1f63d8d426c7c98b80f651dd822b0c1e2b94"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.2/sentry-cli-Linux-x86_64"
        sha256 "a136c3b48ee967852dabe909283a1e7f0640a0c332ae4f30c231d05ba82662dc"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.2/sentry-cli-Linux-i686"
        sha256 "fa4cb3f36dd66d9def597dbb593c20f08a72c576a42d3e7c5ea72f9aa535b56a"
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
