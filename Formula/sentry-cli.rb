class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.17.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.17.2/sentry-cli-Darwin-universal"
    sha256 "5a6048f3eac5ef49f9b788d003a976ecc54d5546606f87d125db930c52323411"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.2/sentry-cli-Linux-aarch64"
        sha256 "9cc2d84b09b3e0e0d062b8893f1d5dec1eee512f465cc2d0dbcf51ca6620d1a0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.2/sentry-cli-Linux-armv7"
        sha256 "4ae82bd29ef00eb258ee6136a46fae745d7f73396e7b7213eb8bcbdf3d3f7bb6"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.2/sentry-cli-Linux-x86_64"
        sha256 "18bfbae6c184d976d30f54375815fabe6cfb4e6b7786298bc56f4f1c76a96c2c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.2/sentry-cli-Linux-i686"
        sha256 "f9ec33357136423f5aac598c8c42fc0f6795a29a332dfc34099c6ba8b1307a0b"
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
