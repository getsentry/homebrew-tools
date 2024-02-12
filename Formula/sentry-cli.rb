class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.28.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.28.4/sentry-cli-Darwin-universal"
    sha256 "bf34f1e642eea9c44651e447324296379b48789536679d632e55293f694eee65"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.4/sentry-cli-Linux-aarch64"
        sha256 "a6e5a56f6448abdb9fdadfecbe0466ba9d6cf34eb9bf946e9aeb6d7e9c34761b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.4/sentry-cli-Linux-armv7"
        sha256 "7cf2ed6b20c7e679f0bd7936c23ff07a4d8b57b33d4ebaffca2095c35c536af5"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.4/sentry-cli-Linux-x86_64"
        sha256 "93b59afb62327b0d9fe1ad1f24e6d4139b93354c0e1517cce6843b6f94e9046b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.4/sentry-cli-Linux-i686"
        sha256 "bb6d8ede87506d04481b601cfd9b73ee17540396730506958c8bfff9ab2ece14"
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
